defmodule LimoniBarberWeb.BarberJobLive.Index do
  use LimoniBarberWeb, :live_view

  alias LimoniBarber.Barbers
  alias LimoniBarber.Barbers.BarberJob

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :barber_jobs, list_barber_jobs())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Barber job")
    |> assign(:barber_job, Barbers.get_barber_job!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Barber job")
    |> assign(:barber_job, %BarberJob{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Barber jobs")
    |> assign(:barber_job, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    barber_job = Barbers.get_barber_job!(id)
    {:ok, _} = Barbers.delete_barber_job(barber_job)

    {:noreply, assign(socket, :barber_jobs, list_barber_jobs())}
  end

  defp list_barber_jobs do
    Barbers.list_barber_jobs()
  end
end
