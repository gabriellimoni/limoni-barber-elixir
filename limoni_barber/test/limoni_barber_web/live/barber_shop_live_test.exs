defmodule LimoniBarberWeb.BarberShopLiveTest do
  use LimoniBarberWeb.ConnCase

  import Phoenix.LiveViewTest
  import LimoniBarber.BarberShopsFixtures

  @create_attrs %{c: "some c", city: "some city", compĺement: "some compĺement", country: "some country", name: "some name", number: "some number", state: "some state", street: "some street"}
  @update_attrs %{c: "some updated c", city: "some updated city", compĺement: "some updated compĺement", country: "some updated country", name: "some updated name", number: "some updated number", state: "some updated state", street: "some updated street"}
  @invalid_attrs %{c: nil, city: nil, compĺement: nil, country: nil, name: nil, number: nil, state: nil, street: nil}

  defp create_barber_shop(_) do
    barber_shop = barber_shop_fixture()
    %{barber_shop: barber_shop}
  end

  describe "Index" do
    setup [:create_barber_shop]

    test "lists all barber_shops", %{conn: conn, barber_shop: barber_shop} do
      {:ok, _index_live, html} = live(conn, Routes.barber_shop_index_path(conn, :index))

      assert html =~ "Listing Barber shops"
      assert html =~ barber_shop.c
    end

    test "saves new barber_shop", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.barber_shop_index_path(conn, :index))

      assert index_live |> element("a", "New Barber shop") |> render_click() =~
               "New Barber shop"

      assert_patch(index_live, Routes.barber_shop_index_path(conn, :new))

      assert index_live
             |> form("#barber_shop-form", barber_shop: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#barber_shop-form", barber_shop: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_shop_index_path(conn, :index))

      assert html =~ "Barber shop created successfully"
      assert html =~ "some c"
    end

    test "updates barber_shop in listing", %{conn: conn, barber_shop: barber_shop} do
      {:ok, index_live, _html} = live(conn, Routes.barber_shop_index_path(conn, :index))

      assert index_live |> element("#barber_shop-#{barber_shop.id} a", "Edit") |> render_click() =~
               "Edit Barber shop"

      assert_patch(index_live, Routes.barber_shop_index_path(conn, :edit, barber_shop))

      assert index_live
             |> form("#barber_shop-form", barber_shop: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#barber_shop-form", barber_shop: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_shop_index_path(conn, :index))

      assert html =~ "Barber shop updated successfully"
      assert html =~ "some updated c"
    end

    test "deletes barber_shop in listing", %{conn: conn, barber_shop: barber_shop} do
      {:ok, index_live, _html} = live(conn, Routes.barber_shop_index_path(conn, :index))

      assert index_live |> element("#barber_shop-#{barber_shop.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#barber_shop-#{barber_shop.id}")
    end
  end

  describe "Show" do
    setup [:create_barber_shop]

    test "displays barber_shop", %{conn: conn, barber_shop: barber_shop} do
      {:ok, _show_live, html} = live(conn, Routes.barber_shop_show_path(conn, :show, barber_shop))

      assert html =~ "Show Barber shop"
      assert html =~ barber_shop.c
    end

    test "updates barber_shop within modal", %{conn: conn, barber_shop: barber_shop} do
      {:ok, show_live, _html} = live(conn, Routes.barber_shop_show_path(conn, :show, barber_shop))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Barber shop"

      assert_patch(show_live, Routes.barber_shop_show_path(conn, :edit, barber_shop))

      assert show_live
             |> form("#barber_shop-form", barber_shop: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#barber_shop-form", barber_shop: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_shop_show_path(conn, :show, barber_shop))

      assert html =~ "Barber shop updated successfully"
      assert html =~ "some updated c"
    end
  end
end
