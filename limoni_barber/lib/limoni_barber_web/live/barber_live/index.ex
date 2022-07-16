defmodule LimoniBarberWeb.BarberLive.Index do
  use LimoniBarberWeb, :live_view

  alias LimoniBarber.Barbers
  alias LimoniBarber.Barbers.Barber

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :barbers, list_barbers())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Barber")
    |> assign(:barber, Barbers.get_barber!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Barber")
    |> assign(:barber, %Barber{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Barbers")
    |> assign(:barber, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    barber = Barbers.get_barber!(id)
    {:ok, _} = Barbers.delete_barber(barber)

    {:noreply, assign(socket, :barbers, list_barbers())}
  end

  defp list_barbers do
    Barbers.list_barbers()
  end
end
