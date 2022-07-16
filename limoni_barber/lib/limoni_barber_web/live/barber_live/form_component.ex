defmodule LimoniBarberWeb.BarberLive.FormComponent do
  use LimoniBarberWeb, :live_component

  alias LimoniBarber.Barbers

  @impl true
  def update(%{barber: barber} = assigns, socket) do
    changeset = Barbers.change_barber(barber)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"barber" => barber_params}, socket) do
    changeset =
      socket.assigns.barber
      |> Barbers.change_barber(barber_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"barber" => barber_params}, socket) do
    save_barber(socket, socket.assigns.action, barber_params)
  end

  defp save_barber(socket, :edit, barber_params) do
    case Barbers.update_barber(socket.assigns.barber, barber_params) do
      {:ok, _barber} ->
        {:noreply,
         socket
         |> put_flash(:info, "Barber updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_barber(socket, :new, barber_params) do
    case Barbers.create_barber(barber_params) do
      {:ok, _barber} ->
        {:noreply,
         socket
         |> put_flash(:info, "Barber created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
