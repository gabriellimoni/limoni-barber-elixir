defmodule LimoniBarberWeb.BarberShopGroupLive.FormComponent do
  use LimoniBarberWeb, :live_component

  alias LimoniBarber.BarberShops

  @impl true
  def update(%{barber_shop_group: barber_shop_group} = assigns, socket) do
    changeset = BarberShops.change_barber_shop_group(barber_shop_group)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"barber_shop_group" => barber_shop_group_params}, socket) do
    changeset =
      socket.assigns.barber_shop_group
      |> BarberShops.change_barber_shop_group(barber_shop_group_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"barber_shop_group" => barber_shop_group_params}, socket) do
    save_barber_shop_group(socket, socket.assigns.action, barber_shop_group_params)
  end

  defp save_barber_shop_group(socket, :edit, barber_shop_group_params) do
    case BarberShops.update_barber_shop_group(socket.assigns.barber_shop_group, barber_shop_group_params) do
      {:ok, _barber_shop_group} ->
        {:noreply,
         socket
         |> put_flash(:info, "Barber shop group updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_barber_shop_group(socket, :new, barber_shop_group_params) do
    case BarberShops.create_barber_shop_group(barber_shop_group_params) do
      {:ok, _barber_shop_group} ->
        {:noreply,
         socket
         |> put_flash(:info, "Barber shop group created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
