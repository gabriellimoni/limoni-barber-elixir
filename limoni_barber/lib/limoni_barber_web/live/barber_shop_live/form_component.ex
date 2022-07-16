defmodule LimoniBarberWeb.BarberShopLive.FormComponent do
  use LimoniBarberWeb, :live_component

  alias LimoniBarber.BarberShops

  @impl true
  def mount(socket) do
    groups = BarberShops.list_barber_shop_groups()
    group_keyword_list = Enum.map(groups, fn group -> {group.name, group.id} end)
    {:ok,
      socket
      |> assign(:group_keyword_list, group_keyword_list)
    }
  end

  @impl true
  def update(%{barber_shop: barber_shop} = assigns, socket) do
    changeset = BarberShops.change_barber_shop(barber_shop)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"barber_shop" => barber_shop_params}, socket) do
    changeset =
      socket.assigns.barber_shop
      |> BarberShops.change_barber_shop(barber_shop_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"barber_shop" => barber_shop_params}, socket) do
    save_barber_shop(socket, socket.assigns.action, barber_shop_params)
  end

  defp save_barber_shop(socket, :edit, barber_shop_params) do
    case BarberShops.update_barber_shop(socket.assigns.barber_shop, barber_shop_params) do
      {:ok, _barber_shop} ->
        {:noreply,
         socket
         |> put_flash(:info, "Barber shop updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_barber_shop(socket, :new, barber_shop_params) do
    case BarberShops.create_barber_shop(barber_shop_params) do
      {:ok, _barber_shop} ->
        {:noreply,
         socket
         |> put_flash(:info, "Barber shop created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
