defmodule LimoniBarberWeb.AttendanceLive.Show do
  use LimoniBarberWeb, :live_view

  alias LimoniBarber.Attendances

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:attendance, Attendances.get_attendance!(id))}
  end

  defp page_title(:show), do: "Show Attendance"
  defp page_title(:edit), do: "Edit Attendance"
end
