defmodule LimoniBarber.BarbersTest do
  use LimoniBarber.DataCase

  alias LimoniBarber.Barbers

  describe "barbers" do
    alias LimoniBarber.Barbers.Barber

    import LimoniBarber.BarbersFixtures

    @invalid_attrs %{description: nil, email: nil, name: nil, phone: nil}

    test "list_barbers/0 returns all barbers" do
      barber = barber_fixture()
      assert Barbers.list_barbers() == [barber]
    end

    test "get_barber!/1 returns the barber with given id" do
      barber = barber_fixture()
      assert Barbers.get_barber!(barber.id) == barber
    end

    test "create_barber/1 with valid data creates a barber" do
      valid_attrs = %{description: "some description", email: "some email", name: "some name", phone: "some phone"}

      assert {:ok, %Barber{} = barber} = Barbers.create_barber(valid_attrs)
      assert barber.description == "some description"
      assert barber.email == "some email"
      assert barber.name == "some name"
      assert barber.phone == "some phone"
    end

    test "create_barber/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Barbers.create_barber(@invalid_attrs)
    end

    test "update_barber/2 with valid data updates the barber" do
      barber = barber_fixture()
      update_attrs = %{description: "some updated description", email: "some updated email", name: "some updated name", phone: "some updated phone"}

      assert {:ok, %Barber{} = barber} = Barbers.update_barber(barber, update_attrs)
      assert barber.description == "some updated description"
      assert barber.email == "some updated email"
      assert barber.name == "some updated name"
      assert barber.phone == "some updated phone"
    end

    test "update_barber/2 with invalid data returns error changeset" do
      barber = barber_fixture()
      assert {:error, %Ecto.Changeset{}} = Barbers.update_barber(barber, @invalid_attrs)
      assert barber == Barbers.get_barber!(barber.id)
    end

    test "delete_barber/1 deletes the barber" do
      barber = barber_fixture()
      assert {:ok, %Barber{}} = Barbers.delete_barber(barber)
      assert_raise Ecto.NoResultsError, fn -> Barbers.get_barber!(barber.id) end
    end

    test "change_barber/1 returns a barber changeset" do
      barber = barber_fixture()
      assert %Ecto.Changeset{} = Barbers.change_barber(barber)
    end
  end
end
