defmodule Zombie.Router do
  use Zombie.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :protected do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :api_auth do
    plug :accepts, ["json"]
  end

  scope "/", Zombie do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
    get "/game", GameController, :index
  end

  scope "/", Zombie do
    pipe_through :protected

  end

  scope "/api", Zombie do
    pipe_through :api

    get "/token/:name", TokenController, :token
  end

  scope "/api", Zombie do
    pipe_through :api_auth

    resources "/users", UserController, except: [:new, :edit]
  end
end
