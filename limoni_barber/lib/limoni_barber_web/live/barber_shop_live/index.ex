defmodule LimoniBarberWeb.BarberShopLive.Index do
  use LimoniBarberWeb, :live_view

  alias LimoniBarber.BarberShops
  alias LimoniBarber.BarberShops.BarberShop

  @impl true
  def mount(_params, _session, socket) do
    {:ok,
      socket
      |> assign(:barber_shops, list_barber_shops())
    }
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Barber shop")
    |> assign(:barber_shop, BarberShops.get_barber_shop!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Barber shop")
    |> assign(:barber_shop, %BarberShop{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Barber shops")
    |> assign(:barber_shop, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    barber_shop = BarberShops.get_barber_shop!(id)
    {:ok, _} = BarberShops.delete_barber_shop(barber_shop)

    {:noreply, assign(socket, :barber_shops, list_barber_shops())}
  end

  defp list_barber_shops do
    BarberShops.list_barber_shops()
  end
end
