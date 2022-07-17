defmodule LimoniBarberWeb.AttendanceLive.Index do
  use LimoniBarberWeb, :live_view

  alias LimoniBarber.Attendances
  alias LimoniBarber.Attendances.Attendance

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :attendances, list_attendances())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Attendance")
    |> assign(:attendance, Attendances.get_attendance!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Attendance")
    |> assign(:attendance, %Attendance{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Attendances")
    |> assign(:attendance, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    attendance = Attendances.get_attendance!(id)
    {:ok, _} = Attendances.delete_attendance(attendance)

    {:noreply, assign(socket, :attendances, list_attendances())}
  end

  defp list_attendances do
    Attendances.list_attendances()
  end
end
