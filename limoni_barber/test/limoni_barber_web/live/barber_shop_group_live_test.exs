defmodule LimoniBarberWeb.BarberShopGroupLiveTest do
  use LimoniBarberWeb.ConnCase

  import Phoenix.LiveViewTest
  import LimoniBarber.BarberShopsFixtures

  @create_attrs %{name: "some name"}
  @update_attrs %{name: "some updated name"}
  @invalid_attrs %{name: nil}

  defp create_barber_shop_group(_) do
    barber_shop_group = barber_shop_group_fixture()
    %{barber_shop_group: barber_shop_group}
  end

  describe "Index" do
    setup [:create_barber_shop_group]

    test "lists all barber_shop_groups", %{conn: conn, barber_shop_group: barber_shop_group} do
      {:ok, _index_live, html} = live(conn, Routes.barber_shop_group_index_path(conn, :index))

      assert html =~ "Listing Barber shop groups"
      assert html =~ barber_shop_group.name
    end

    test "saves new barber_shop_group", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.barber_shop_group_index_path(conn, :index))

      assert index_live |> element("a", "New Barber shop group") |> render_click() =~
               "New Barber shop group"

      assert_patch(index_live, Routes.barber_shop_group_index_path(conn, :new))

      assert index_live
             |> form("#barber_shop_group-form", barber_shop_group: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#barber_shop_group-form", barber_shop_group: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_shop_group_index_path(conn, :index))

      assert html =~ "Barber shop group created successfully"
      assert html =~ "some name"
    end

    test "updates barber_shop_group in listing", %{conn: conn, barber_shop_group: barber_shop_group} do
      {:ok, index_live, _html} = live(conn, Routes.barber_shop_group_index_path(conn, :index))

      assert index_live |> element("#barber_shop_group-#{barber_shop_group.id} a", "Edit") |> render_click() =~
               "Edit Barber shop group"

      assert_patch(index_live, Routes.barber_shop_group_index_path(conn, :edit, barber_shop_group))

      assert index_live
             |> form("#barber_shop_group-form", barber_shop_group: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#barber_shop_group-form", barber_shop_group: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_shop_group_index_path(conn, :index))

      assert html =~ "Barber shop group updated successfully"
      assert html =~ "some updated name"
    end

    test "deletes barber_shop_group in listing", %{conn: conn, barber_shop_group: barber_shop_group} do
      {:ok, index_live, _html} = live(conn, Routes.barber_shop_group_index_path(conn, :index))

      assert index_live |> element("#barber_shop_group-#{barber_shop_group.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#barber_shop_group-#{barber_shop_group.id}")
    end
  end

  describe "Show" do
    setup [:create_barber_shop_group]

    test "displays barber_shop_group", %{conn: conn, barber_shop_group: barber_shop_group} do
      {:ok, _show_live, html} = live(conn, Routes.barber_shop_group_show_path(conn, :show, barber_shop_group))

      assert html =~ "Show Barber shop group"
      assert html =~ barber_shop_group.name
    end

    test "updates barber_shop_group within modal", %{conn: conn, barber_shop_group: barber_shop_group} do
      {:ok, show_live, _html} = live(conn, Routes.barber_shop_group_show_path(conn, :show, barber_shop_group))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Barber shop group"

      assert_patch(show_live, Routes.barber_shop_group_show_path(conn, :edit, barber_shop_group))

      assert show_live
             |> form("#barber_shop_group-form", barber_shop_group: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#barber_shop_group-form", barber_shop_group: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_shop_group_show_path(conn, :show, barber_shop_group))

      assert html =~ "Barber shop group updated successfully"
      assert html =~ "some updated name"
    end
  end
end
