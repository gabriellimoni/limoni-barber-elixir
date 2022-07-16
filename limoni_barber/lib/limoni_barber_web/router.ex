defmodule LimoniBarberWeb.Router do
  use LimoniBarberWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LimoniBarberWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LimoniBarberWeb do
    pipe_through :browser

    get "/", PageController, :index

    live "/barber_shop_groups", BarberShopGroupLive.Index, :index
    live "/barber_shop_groups/new", BarberShopGroupLive.Index, :new
    live "/barber_shop_groups/:id/edit", BarberShopGroupLive.Index, :edit

    live "/barber_shop_groups/:id", BarberShopGroupLive.Show, :show
    live "/barber_shop_groups/:id/show/edit", BarberShopGroupLive.Show, :edit

    live "/barber_shops", BarberShopLive.Index, :index
    live "/barber_shops/new", BarberShopLive.Index, :new
    live "/barber_shops/:id/edit", BarberShopLive.Index, :edit

    live "/barber_shops/:id", BarberShopLive.Show, :show
    live "/barber_shops/:id/show/edit", BarberShopLive.Show, :edit

    live "/barbers", BarberLive.Index, :index
    live "/barbers/new", BarberLive.Index, :new
    live "/barbers/:id/edit", BarberLive.Index, :edit

    live "/barbers/:id", BarberLive.Show, :show
    live "/barbers/:id/show/edit", BarberLive.Show, :edit
  end

  # Other scopes may use custom stacks.
  # scope "/api", LimoniBarberWeb do
  #   pipe_through :api
  # end

  # Enables LiveDashboard only for development
  #
  # If you want to use the LiveDashboard in production, you should put
  # it behind authentication and allow only admins to access it.
  # If your application does not have an admins-only section yet,
  # you can use Plug.BasicAuth to set up some basic authentication
  # as long as you are also using SSL (which you should anyway).
  if Mix.env() in [:dev, :test] do
    import Phoenix.LiveDashboard.Router

    scope "/" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: LimoniBarberWeb.Telemetry
    end
  end

  # Enables the Swoosh mailbox preview in development.
  #
  # Note that preview only shows emails that were sent by the same
  # node running the Phoenix server.
  if Mix.env() == :dev do
    scope "/dev" do
      pipe_through :browser

      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
