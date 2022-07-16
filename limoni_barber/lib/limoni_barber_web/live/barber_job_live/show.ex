defmodule LimoniBarberWeb.BarberJobLive.Show do
  use LimoniBarberWeb, :live_view

  alias LimoniBarber.Barbers

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:barber_job, Barbers.get_barber_job!(id))}
  end

  defp page_title(:show), do: "Show Barber job"
  defp page_title(:edit), do: "Edit Barber job"
end
