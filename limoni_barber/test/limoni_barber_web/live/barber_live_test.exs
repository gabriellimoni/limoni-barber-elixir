defmodule LimoniBarberWeb.BarberLiveTest do
  use LimoniBarberWeb.ConnCase

  import Phoenix.LiveViewTest
  import LimoniBarber.BarbersFixtures

  @create_attrs %{description: "some description", email: "some email", name: "some name", phone: "some phone"}
  @update_attrs %{description: "some updated description", email: "some updated email", name: "some updated name", phone: "some updated phone"}
  @invalid_attrs %{description: nil, email: nil, name: nil, phone: nil}

  defp create_barber(_) do
    barber = barber_fixture()
    %{barber: barber}
  end

  describe "Index" do
    setup [:create_barber]

    test "lists all barbers", %{conn: conn, barber: barber} do
      {:ok, _index_live, html} = live(conn, Routes.barber_index_path(conn, :index))

      assert html =~ "Listing Barbers"
      assert html =~ barber.description
    end

    test "saves new barber", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.barber_index_path(conn, :index))

      assert index_live |> element("a", "New Barber") |> render_click() =~
               "New Barber"

      assert_patch(index_live, Routes.barber_index_path(conn, :new))

      assert index_live
             |> form("#barber-form", barber: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#barber-form", barber: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_index_path(conn, :index))

      assert html =~ "Barber created successfully"
      assert html =~ "some description"
    end

    test "updates barber in listing", %{conn: conn, barber: barber} do
      {:ok, index_live, _html} = live(conn, Routes.barber_index_path(conn, :index))

      assert index_live |> element("#barber-#{barber.id} a", "Edit") |> render_click() =~
               "Edit Barber"

      assert_patch(index_live, Routes.barber_index_path(conn, :edit, barber))

      assert index_live
             |> form("#barber-form", barber: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#barber-form", barber: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_index_path(conn, :index))

      assert html =~ "Barber updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes barber in listing", %{conn: conn, barber: barber} do
      {:ok, index_live, _html} = live(conn, Routes.barber_index_path(conn, :index))

      assert index_live |> element("#barber-#{barber.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#barber-#{barber.id}")
    end
  end

  describe "Show" do
    setup [:create_barber]

    test "displays barber", %{conn: conn, barber: barber} do
      {:ok, _show_live, html} = live(conn, Routes.barber_show_path(conn, :show, barber))

      assert html =~ "Show Barber"
      assert html =~ barber.description
    end

    test "updates barber within modal", %{conn: conn, barber: barber} do
      {:ok, show_live, _html} = live(conn, Routes.barber_show_path(conn, :show, barber))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Barber"

      assert_patch(show_live, Routes.barber_show_path(conn, :edit, barber))

      assert show_live
             |> form("#barber-form", barber: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#barber-form", barber: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_show_path(conn, :show, barber))

      assert html =~ "Barber updated successfully"
      assert html =~ "some updated description"
    end
  end
end
