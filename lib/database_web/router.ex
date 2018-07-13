defmodule DatabaseWeb.Router do
  use DatabaseWeb, :router

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

  scope "/", DatabaseWeb do
    pipe_through :api # Use the default browser stack
    resources "/persons", PersonController, except: [:new, :edit]
    resources "/locations", LocationController, except: [:new, :edit]
    resources "/medias", MediaController, except: [:new, :edit]
    resources "/venues", VenueController, except: [:new, :edit]
    resources "/events", EventController, except: [:new, :edit]
    resources "/hosts", HostController, except: [:new, :edit]
    resources "/pools", PoolController, except: [:new, :edit]
    resources "/messages", MessageController, except: [:new, :edit]
    resources "/surveys", SurveyController, except: [:new, :edit]
    resources "/palss", PalsController, except: [:new, :edit]
    resources "/passs", PassController, except: [:new, :edit]
    resources "/contextvals", ContextValController, except: [:new, :edit]
    resources "/profilecontents", ProfileContentController, except: [:new, :edit]
    resources "/galss", GalsController, except: [:new, :edit]
    resources "/genders", GenderController, except: [:new, :edit]
    resources "/versions", VersionController, except: [:new, :edit]
    get "/", PageController, :index
  end

  forward "/api", Absinthe.Plug,
    schema: DatabaseWeb.Schema

  forward "/graphiql", Absinthe.Plug.GraphiQL,
    schema: DatabaseWeb.Schema

  # Other scopes may use custom stacks.
  # scope "/api", DatabaseWeb do
  #   pipe_through :api
  # end
end
