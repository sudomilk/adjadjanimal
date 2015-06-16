adjectives = File.read! "adjectives"
adj_list = String.split adjectives, "\n"
animals = File.read! "animals"
ani_list = String.split animals, "\n"


defmodule Random do
  def init() do
    :random.seed(:erlang.now())
  end
  def pick_element(list) do
    Enum.at(list, :random.uniform(Enum.count(list)) - 1)
  end
end

Random.init()
first = Random.pick_element(adj_list)
second = Random.pick_element(adj_list)
animal = Random.pick_element(ani_list)

uncapd = [first, second, animal]

defmodule Capper do
  def caplist([head | tail]) do
    [String.capitalize(head) | caplist(tail)]
  end

  def caplist([]) do
    []
  end
end

uncapd |> Capper.caplist |>  IO.puts
