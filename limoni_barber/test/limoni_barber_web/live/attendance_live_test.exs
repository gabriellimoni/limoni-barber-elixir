defmodule LimoniBarberWeb.AttendanceLiveTest do
  use LimoniBarberWeb.ConnCase

  import Phoenix.LiveViewTest
  import LimoniBarber.AttendancesFixtures

  @create_attrs %{canceled_at: %{day: 15, hour: 22, minute: 28, month: 7, year: 2022}, finished_at: %{day: 15, hour: 22, minute: 28, month: 7, year: 2022}, schedule: %{day: 15, hour: 22, minute: 28, month: 7, year: 2022}, status: :scheduled}
  @update_attrs %{canceled_at: %{day: 16, hour: 22, minute: 28, month: 7, year: 2022}, finished_at: %{day: 16, hour: 22, minute: 28, month: 7, year: 2022}, schedule: %{day: 16, hour: 22, minute: 28, month: 7, year: 2022}, status: :canceled}
  @invalid_attrs %{canceled_at: %{day: 30, hour: 22, minute: 28, month: 2, year: 2022}, finished_at: %{day: 30, hour: 22, minute: 28, month: 2, year: 2022}, schedule: %{day: 30, hour: 22, minute: 28, month: 2, year: 2022}, status: nil}

  defp create_attendance(_) do
    attendance = attendance_fixture()
    %{attendance: attendance}
  end

  describe "Index" do
    setup [:create_attendance]

    test "lists all attendances", %{conn: conn} do
      {:ok, _index_live, html} = live(conn, Routes.attendance_index_path(conn, :index))

      assert html =~ "Listing Attendances"
    end

    test "saves new attendance", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.attendance_index_path(conn, :index))

      assert index_live |> element("a", "New Attendance") |> render_click() =~
               "New Attendance"

      assert_patch(index_live, Routes.attendance_index_path(conn, :new))

      assert index_live
             |> form("#attendance-form", attendance: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#attendance-form", attendance: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.attendance_index_path(conn, :index))

      assert html =~ "Attendance created successfully"
    end

    test "updates attendance in listing", %{conn: conn, attendance: attendance} do
      {:ok, index_live, _html} = live(conn, Routes.attendance_index_path(conn, :index))

      assert index_live |> element("#attendance-#{attendance.id} a", "Edit") |> render_click() =~
               "Edit Attendance"

      assert_patch(index_live, Routes.attendance_index_path(conn, :edit, attendance))

      assert index_live
             |> form("#attendance-form", attendance: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        index_live
        |> form("#attendance-form", attendance: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.attendance_index_path(conn, :index))

      assert html =~ "Attendance updated successfully"
    end

    test "deletes attendance in listing", %{conn: conn, attendance: attendance} do
      {:ok, index_live, _html} = live(conn, Routes.attendance_index_path(conn, :index))

      assert index_live |> element("#attendance-#{attendance.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#attendance-#{attendance.id}")
    end
  end

  describe "Show" do
    setup [:create_attendance]

    test "displays attendance", %{conn: conn, attendance: attendance} do
      {:ok, _show_live, html} = live(conn, Routes.attendance_show_path(conn, :show, attendance))

      assert html =~ "Show Attendance"
    end

    test "updates attendance within modal", %{conn: conn, attendance: attendance} do
      {:ok, show_live, _html} = live(conn, Routes.attendance_show_path(conn, :show, attendance))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Attendance"

      assert_patch(show_live, Routes.attendance_show_path(conn, :edit, attendance))

      assert show_live
             |> form("#attendance-form", attendance: @invalid_attrs)
             |> render_change() =~ "is invalid"

      {:ok, _, html} =
        show_live
        |> form("#attendance-form", attendance: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.attendance_show_path(conn, :show, attendance))

      assert html =~ "Attendance updated successfully"
    end
  end
end
