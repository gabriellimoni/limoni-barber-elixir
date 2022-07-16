defmodule LimoniBarberWeb.BarberJobLive.FormComponent do
  use LimoniBarberWeb, :live_component

  alias LimoniBarber.Barbers

  @impl true
  def mount(socket) do
    barbers = Barbers.list_barbers()
    barbers_options = Enum.map(barbers, fn barber -> {barber.name, barber.id} end)
    {:ok, socket |> assign(:barbers_options, barbers_options)}
  end

  @impl true
  def update(%{barber_job: barber_job} = assigns, socket) do
    changeset = Barbers.change_barber_job(barber_job)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"barber_job" => barber_job_params}, socket) do
    changeset =
      socket.assigns.barber_job
      |> Barbers.change_barber_job(barber_job_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"barber_job" => barber_job_params}, socket) do
    save_barber_job(socket, socket.assigns.action, barber_job_params)
  end

  defp save_barber_job(socket, :edit, barber_job_params) do
    case Barbers.update_barber_job(socket.assigns.barber_job, barber_job_params) do
      {:ok, _barber_job} ->
        {:noreply,
         socket
         |> put_flash(:info, "Barber job updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_barber_job(socket, :new, barber_job_params) do
    case Barbers.create_barber_job(barber_job_params) do
      {:ok, _barber_job} ->
        {:noreply,
         socket
         |> put_flash(:info, "Barber job created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
