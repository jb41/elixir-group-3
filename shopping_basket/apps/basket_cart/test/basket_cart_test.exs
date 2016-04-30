defmodule BasketCartTest do
  use ExUnit.Case
  doctest BasketCart

  test "How many items in the cart" do
    assert BasketCart.count(BasketCart.new) == 0
  end

  test "Add item to basket" do
    cart = BasketCart.new
    new_cart = BasketCart.add(cart, "Banana")

    assert BasketCart.count(new_cart) == 1
    assert BasketCart.current_items(new_cart) == ["Banana"]
  end
end
