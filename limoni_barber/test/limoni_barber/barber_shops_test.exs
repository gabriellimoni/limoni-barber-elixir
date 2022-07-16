defmodule LimoniBarber.BarberShopsTest do
  use LimoniBarber.DataCase

  alias LimoniBarber.BarberShops

  describe "barber_shop_groups" do
    alias LimoniBarber.BarberShops.BarberShopGroup

    import LimoniBarber.BarberShopsFixtures

    @invalid_attrs %{name: nil}

    test "list_barber_shop_groups/0 returns all barber_shop_groups" do
      barber_shop_group = barber_shop_group_fixture()
      assert BarberShops.list_barber_shop_groups() == [barber_shop_group]
    end

    test "get_barber_shop_group!/1 returns the barber_shop_group with given id" do
      barber_shop_group = barber_shop_group_fixture()
      assert BarberShops.get_barber_shop_group!(barber_shop_group.id) == barber_shop_group
    end

    test "create_barber_shop_group/1 with valid data creates a barber_shop_group" do
      valid_attrs = %{name: "some name"}

      assert {:ok, %BarberShopGroup{} = barber_shop_group} = BarberShops.create_barber_shop_group(valid_attrs)
      assert barber_shop_group.name == "some name"
    end

    test "create_barber_shop_group/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BarberShops.create_barber_shop_group(@invalid_attrs)
    end

    test "update_barber_shop_group/2 with valid data updates the barber_shop_group" do
      barber_shop_group = barber_shop_group_fixture()
      update_attrs = %{name: "some updated name"}

      assert {:ok, %BarberShopGroup{} = barber_shop_group} = BarberShops.update_barber_shop_group(barber_shop_group, update_attrs)
      assert barber_shop_group.name == "some updated name"
    end

    test "update_barber_shop_group/2 with invalid data returns error changeset" do
      barber_shop_group = barber_shop_group_fixture()
      assert {:error, %Ecto.Changeset{}} = BarberShops.update_barber_shop_group(barber_shop_group, @invalid_attrs)
      assert barber_shop_group == BarberShops.get_barber_shop_group!(barber_shop_group.id)
    end

    test "delete_barber_shop_group/1 deletes the barber_shop_group" do
      barber_shop_group = barber_shop_group_fixture()
      assert {:ok, %BarberShopGroup{}} = BarberShops.delete_barber_shop_group(barber_shop_group)
      assert_raise Ecto.NoResultsError, fn -> BarberShops.get_barber_shop_group!(barber_shop_group.id) end
    end

    test "change_barber_shop_group/1 returns a barber_shop_group changeset" do
      barber_shop_group = barber_shop_group_fixture()
      assert %Ecto.Changeset{} = BarberShops.change_barber_shop_group(barber_shop_group)
    end
  end

  describe "barber_shops" do
    alias LimoniBarber.BarberShops.BarberShop

    import LimoniBarber.BarberShopsFixtures

    @invalid_attrs %{c: nil, city: nil, compĺement: nil, country: nil, name: nil, number: nil, state: nil, street: nil}

    test "list_barber_shops/0 returns all barber_shops" do
      barber_shop = barber_shop_fixture()
      assert BarberShops.list_barber_shops() == [barber_shop]
    end

    test "get_barber_shop!/1 returns the barber_shop with given id" do
      barber_shop = barber_shop_fixture()
      assert BarberShops.get_barber_shop!(barber_shop.id) == barber_shop
    end

    test "create_barber_shop/1 with valid data creates a barber_shop" do
      valid_attrs = %{c: "some c", city: "some city", compĺement: "some compĺement", country: "some country", name: "some name", number: "some number", state: "some state", street: "some street"}

      assert {:ok, %BarberShop{} = barber_shop} = BarberShops.create_barber_shop(valid_attrs)
      assert barber_shop.c == "some c"
      assert barber_shop.city == "some city"
      assert barber_shop.compĺement == "some compĺement"
      assert barber_shop.country == "some country"
      assert barber_shop.name == "some name"
      assert barber_shop.number == "some number"
      assert barber_shop.state == "some state"
      assert barber_shop.street == "some street"
    end

    test "create_barber_shop/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = BarberShops.create_barber_shop(@invalid_attrs)
    end

    test "update_barber_shop/2 with valid data updates the barber_shop" do
      barber_shop = barber_shop_fixture()
      update_attrs = %{c: "some updated c", city: "some updated city", compĺement: "some updated compĺement", country: "some updated country", name: "some updated name", number: "some updated number", state: "some updated state", street: "some updated street"}

      assert {:ok, %BarberShop{} = barber_shop} = BarberShops.update_barber_shop(barber_shop, update_attrs)
      assert barber_shop.c == "some updated c"
      assert barber_shop.city == "some updated city"
      assert barber_shop.compĺement == "some updated compĺement"
      assert barber_shop.country == "some updated country"
      assert barber_shop.name == "some updated name"
      assert barber_shop.number == "some updated number"
      assert barber_shop.state == "some updated state"
      assert barber_shop.street == "some updated street"
    end

    test "update_barber_shop/2 with invalid data returns error changeset" do
      barber_shop = barber_shop_fixture()
      assert {:error, %Ecto.Changeset{}} = BarberShops.update_barber_shop(barber_shop, @invalid_attrs)
      assert barber_shop == BarberShops.get_barber_shop!(barber_shop.id)
    end

    test "delete_barber_shop/1 deletes the barber_shop" do
      barber_shop = barber_shop_fixture()
      assert {:ok, %BarberShop{}} = BarberShops.delete_barber_shop(barber_shop)
      assert_raise Ecto.NoResultsError, fn -> BarberShops.get_barber_shop!(barber_shop.id) end
    end

    test "change_barber_shop/1 returns a barber_shop changeset" do
      barber_shop = barber_shop_fixture()
      assert %Ecto.Changeset{} = BarberShops.change_barber_shop(barber_shop)
    end
  end
end
