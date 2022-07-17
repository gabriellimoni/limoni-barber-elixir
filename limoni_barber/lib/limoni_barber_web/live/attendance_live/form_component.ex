defmodule LimoniBarberWeb.AttendanceLive.FormComponent do
  use LimoniBarberWeb, :live_component

  alias LimoniBarber.Attendances
  alias LimoniBarber.BarberShops
  alias LimoniBarber.Barbers

  @impl true
  def mount(socket) do
    patients = Attendances.list_patients()
    barber_shops = BarberShops.list_barber_shops()

    barber_shop_options = Enum.map(barber_shops, fn shop -> {shop.name, shop.id} end)
    patient_options = Enum.map(patients, fn patient -> {patient.name, patient.id} end)

    {:ok, socket
    |> assign(:barber_shop_options, barber_shop_options)
    |> assign(:patient_options, patient_options)
    |> assign(:barber_job_options, nil)
    }
  end

  @impl true
  def update(%{attendance: attendance} = assigns, socket) do
    IO.puts "AAAAAAAAAAAAAAAAA"
    changeset = Attendances.change_attendance(attendance)
    barber_job_options = get_barber_job_options(attendance.barber_shop_id)

    {:ok,
      socket
        |> assign(assigns)
        |> assign(:changeset, changeset)
        |> assign(:barber_job_options, barber_job_options)}
  end

  @impl true
  def handle_event("validate", %{"attendance" => attendance_params}, socket) do
    changeset =
      socket.assigns.attendance
      |> Attendances.change_attendance(attendance_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  @impl true
  def handle_event("change_shop", %{"attendance" => %{"barber_shop_id" => id}}, socket) do
    barber_job_options = get_barber_job_options(id)
    {:noreply, socket |> assign(:barber_job_options, barber_job_options)}
  end

  def handle_event("save", %{"attendance" => attendance_params}, socket) do
    save_attendance(socket, socket.assigns.action, attendance_params)
  end

  defp save_attendance(socket, :edit, attendance_params) do
    case Attendances.update_attendance(socket.assigns.attendance, attendance_params) do
      {:ok, _attendance} ->
        {:noreply,
         socket
         |> put_flash(:info, "Attendance updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_attendance(socket, :new, attendance_params) do
    case Attendances.create_attendance(attendance_params) do
      {:ok, _attendance} ->
        {:noreply,
         socket
         |> put_flash(:info, "Attendance created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end

  defp get_barber_job_options(barber_shop_id) do
    case barber_shop_id do
      "" -> nil
      _ ->
      barber_jobs = Barbers.get_barber_jobs_by_shop!(barber_shop_id)
      Enum.map(barber_jobs, fn job -> {"#{job.barber.name} - #{job.name}", job.id} end)
    end
  end
end
