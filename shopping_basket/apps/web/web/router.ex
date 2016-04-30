defmodule Web.Router do
  use Web.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Web do
    pipe_through :api
    post "/basket/:basket_id/events", EventsController, :createEvent
    get "/basket/:basket_id/contents", BasketsController, :show
  end

end
