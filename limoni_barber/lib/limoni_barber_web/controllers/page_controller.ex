defmodule LimoniBarberWeb.PageController do
  use LimoniBarberWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
