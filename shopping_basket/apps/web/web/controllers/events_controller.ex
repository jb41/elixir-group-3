defmodule Web.EventsController do
  use Web.Web, :controller

  def createEvent(conn, %{"basket_id" => basket_id, "item" => item, "event" => "add"}) do
    BasketCart.BasketManager.add_item basket_id, item
    json conn, %{basketId: basket_id, count: BasketCart.BasketManager.count basket_id}
  end

  def createEvent(conn, %{"basket_id" => basket_id, "item" => item, "event" => "remove"}) do
    BasketCart.BasketManager.remove_item basket_id, item
    json conn, %{basketId: basket_id, count: BasketCart.BasketManager.count basket_id}
  end

end
