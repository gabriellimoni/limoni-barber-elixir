defmodule LimoniBarberWeb.Router do
  use LimoniBarberWeb, :router

  import LimoniBarberWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {LimoniBarberWeb.LayoutView, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", LimoniBarberWeb do
    pipe_through :browser

    get "/", PageController, :index

    # BarberShopGroups
    live "/barber_shop_groups", BarberShopGroupLive.Index, :index
    live "/barber_shop_groups/new", BarberShopGroupLive.Index, :new
    live "/barber_shop_groups/:id/edit", BarberShopGroupLive.Index, :edit
    live "/barber_shop_groups/:id", BarberShopGroupLive.Show, :show
    live "/barber_shop_groups/:id/show/edit", BarberShopGroupLive.Show, :edit

    # BarberShops
    live "/barber_shops", BarberShopLive.Index, :index
    live "/barber_shops/new", BarberShopLive.Index, :new
    live "/barber_shops/:id/edit", BarberShopLive.Index, :edit
    live "/barber_shops/:id", BarberShopLive.Show, :show
    live "/barber_shops/:id/show/edit", BarberShopLive.Show, :edit

    # Barbers
    live "/barbers", BarberLive.Index, :index
    live "/barbers/new", BarberLive.Index, :new
    live "/barbers/:id/edit", BarberLive.Index, :edit
    live "/barbers/:id", BarberLive.Show, :show
    live "/barbers/:id/show/edit", BarberLive.Show, :edit

    # BarberJobs
    live "/barber_jobs", BarberJobLive.Index, :index
    live "/barber_jobs/new", BarberJobLive.Index, :new
    live "/barber_jobs/:id/edit", BarberJobLive.Index, :edit
    live "/barber_jobs/:id", BarberJobLive.Show, :show
    live "/barber_jobs/:id/show/edit", BarberJobLive.Show, :edit

    #Patients
    live "/patients", PatientLive.Index, :index
    live "/patients/new", PatientLive.Index, :new
    live "/patients/:id/edit", PatientLive.Index, :edit
    live "/patients/:id", PatientLive.Show, :show
    live "/patients/:id/show/edit", PatientLive.Show, :edit

    # Attendances
    live "/attendances", AttendanceLive.Index, :index
    live "/attendances/new", AttendanceLive.Index, :new
    live "/attendances/:id/edit", AttendanceLive.Index, :edit
    live "/attendances/:id", AttendanceLive.Show, :show
    live "/attendances/:id/show/edit", AttendanceLive.Show, :edit
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

  ## Authentication routes

  scope "/", LimoniBarberWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    get "/users/register", UserRegistrationController, :new
    post "/users/register", UserRegistrationController, :create
    get "/users/log_in", UserSessionController, :new
    post "/users/log_in", UserSessionController, :create
    get "/users/reset_password", UserResetPasswordController, :new
    post "/users/reset_password", UserResetPasswordController, :create
    get "/users/reset_password/:token", UserResetPasswordController, :edit
    put "/users/reset_password/:token", UserResetPasswordController, :update
  end

  scope "/", LimoniBarberWeb do
    pipe_through [:browser, :require_authenticated_user]

    get "/users/settings", UserSettingsController, :edit
    put "/users/settings", UserSettingsController, :update
    get "/users/settings/confirm_email/:token", UserSettingsController, :confirm_email
  end

  scope "/", LimoniBarberWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete
    get "/users/confirm", UserConfirmationController, :new
    post "/users/confirm", UserConfirmationController, :create
    get "/users/confirm/:token", UserConfirmationController, :edit
    post "/users/confirm/:token", UserConfirmationController, :update
  end
end
