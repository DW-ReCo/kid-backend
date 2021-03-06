defmodule KidWeb.Router do
  use KidWeb, :router

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

  scope "/", KidWeb do
    pipe_through :browser
  end

  # Other scopes may use custom stacks.
  # scope "/api", KidWeb do
  #   pipe_through :api
  # end

  # Pipeline implements "maybe" authenticated. We'll use the `:ensure_auth` below for when we need to make sure someone is logged in.
  pipeline :auth do
    plug Kid.Accounts.Pipeline
  end

  # We use ensure_auth to fail if there is no one logged in
  pipeline :ensure_auth do
    plug Guardian.Plug.EnsureAuthenticated
  end

  # Maybe logged in routes
  scope "/", KidWeb do
    pipe_through [:browser, :auth]

    get "/", PageController, :index

    get "/login", SessionController, :new
    post "/login", SessionController, :login
    get "/logout", SessionController, :logout
  end

  # Definitely logged in scope
  scope "/", KidWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    get "/dashboard", PageController, :dashboard
  end

  scope "/users", KidWeb do
    pipe_through [:browser, :auth, :ensure_auth]

    resources "/", UserController
  end
end
