defmodule Joyvote.Router do
  use Joyvote.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
    plug Guardian.Plug.VerifySession
    plug Guardian.Plug.LoadResource
  end

  scope "/", Joyvote do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/login", SessionController, :new
    get "/logout", SessionController, :delete
    get "/register", UserController, :new
    post "/register", UserController, :create

    resources "/users", UserController, except: [:new, :create]
  end

  # Other scopes may use custom stacks.
  # scope "/api", Joyvote do
  #   pipe_through :api
  # end
end
