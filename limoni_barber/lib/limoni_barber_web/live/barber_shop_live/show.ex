defmodule LimoniBarberWeb.BarberShopLive.Show do
  use LimoniBarberWeb, :live_view

  alias LimoniBarber.BarberShops

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:barber_shop, BarberShops.get_barber_shop!(id))}
  end

  defp page_title(:show), do: "Show Barber shop"
  defp page_title(:edit), do: "Edit Barber shop"
end
