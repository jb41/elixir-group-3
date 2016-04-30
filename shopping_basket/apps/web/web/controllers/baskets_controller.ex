defmodule Web.BasketsController do
  use Web.Web, :controller

  def show(conn, %{"basket_id" => basket_id}) do
    json conn, %{basketId: basket_id, contents: BasketCart.BasketManager.contents basket_id}
  end
end

