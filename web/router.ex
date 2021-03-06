defmodule Tuxedo.Router do
  use Tuxedo.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", Tuxedo do
    pipe_through :browser # Use the default browser stack

    get "*path", PageController, :index
  end

  scope "/api", Tuxedo do
    pipe_through :api

    scope "/v1" do
      post "/registrations", RegistrationController, :create
    end
  end
end
