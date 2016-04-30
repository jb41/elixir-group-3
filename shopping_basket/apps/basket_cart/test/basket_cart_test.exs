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

  test "Add another item to basket" do
    cart = BasketCart.new
    cart2 = BasketCart.add(cart, "Banana")
    cart3 = BasketCart.add(cart2, "Banana")

    assert BasketCart.count(cart3) == 2
    assert BasketCart.current_items(cart3) == ["Banana", "Banana"]
  end

  test "Remove an item from basket" do
    cart = BasketCart.new
    cart = BasketCart.add(cart, "Banana")
    cart = BasketCart.add(cart, "Orange")
    cart = BasketCart.remove(cart, "Banana")

    assert BasketCart.count(cart) == 1
    assert BasketCart.current_items(cart) == ["Orange"]
  end
end
