defmodule LimoniBarberWeb.BarberShopGroupLive.Index do
  use LimoniBarberWeb, :live_view

  alias LimoniBarber.BarberShops
  alias LimoniBarber.BarberShops.BarberShopGroup

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :barber_shop_groups, list_barber_shop_groups())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Barber shop group")
    |> assign(:barber_shop_group, BarberShops.get_barber_shop_group!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Barber shop group")
    |> assign(:barber_shop_group, %BarberShopGroup{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Barber shop groups")
    |> assign(:barber_shop_group, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    barber_shop_group = BarberShops.get_barber_shop_group!(id)
    {:ok, _} = BarberShops.delete_barber_shop_group(barber_shop_group)

    {:noreply, assign(socket, :barber_shop_groups, list_barber_shop_groups())}
  end

  defp list_barber_shop_groups do
    BarberShops.list_barber_shop_groups()
  end
end
