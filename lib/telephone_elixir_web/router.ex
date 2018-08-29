defmodule TelephoneElixirWeb.Router do
  use TelephoneElixirWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", TelephoneElixirWeb do
    pipe_through :browser # Use the default browser stack
    resources "/informations", InformationController
    resources "/bill", BillController

    get "/", PageController, :index
  end

  scope "/api" do
    pipe_through :api

    forward "/graphiql", Absinthe.Plug.GraphiQL,
      schema: Api.Schema,
      interface: :playground

    forward "/", Absinthe.Plug,
      schema: Api.Schema
  end
end
