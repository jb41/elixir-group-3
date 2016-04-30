defmodule BasketCart do
  def new do
    []
  end

  def count(basket) do
    Enum.count(current_items(basket))
  end

  def add(basket, item) do
    [{:add, item} | basket]
  end

  def remove(basket, item) do
    [{:remove, item} | basket]
  end

  def current_items basket do
    List.foldr(basket, [], fn
      {:add, item}, acc -> [item | acc]
      {:remove, item}, acc -> acc -- [item]
    end)
  end
end
