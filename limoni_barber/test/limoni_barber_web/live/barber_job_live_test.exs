defmodule LimoniBarberWeb.BarberJobLiveTest do
  use LimoniBarberWeb.ConnCase

  import Phoenix.LiveViewTest
  import LimoniBarber.BarbersFixtures

  @create_attrs %{description: "some description", name: "some name", price_in_cents: 42}
  @update_attrs %{description: "some updated description", name: "some updated name", price_in_cents: 43}
  @invalid_attrs %{description: nil, name: nil, price_in_cents: nil}

  defp create_barber_job(_) do
    barber_job = barber_job_fixture()
    %{barber_job: barber_job}
  end

  describe "Index" do
    setup [:create_barber_job]

    test "lists all barber_jobs", %{conn: conn, barber_job: barber_job} do
      {:ok, _index_live, html} = live(conn, Routes.barber_job_index_path(conn, :index))

      assert html =~ "Listing Barber jobs"
      assert html =~ barber_job.description
    end

    test "saves new barber_job", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.barber_job_index_path(conn, :index))

      assert index_live |> element("a", "New Barber job") |> render_click() =~
               "New Barber job"

      assert_patch(index_live, Routes.barber_job_index_path(conn, :new))

      assert index_live
             |> form("#barber_job-form", barber_job: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#barber_job-form", barber_job: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_job_index_path(conn, :index))

      assert html =~ "Barber job created successfully"
      assert html =~ "some description"
    end

    test "updates barber_job in listing", %{conn: conn, barber_job: barber_job} do
      {:ok, index_live, _html} = live(conn, Routes.barber_job_index_path(conn, :index))

      assert index_live |> element("#barber_job-#{barber_job.id} a", "Edit") |> render_click() =~
               "Edit Barber job"

      assert_patch(index_live, Routes.barber_job_index_path(conn, :edit, barber_job))

      assert index_live
             |> form("#barber_job-form", barber_job: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#barber_job-form", barber_job: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_job_index_path(conn, :index))

      assert html =~ "Barber job updated successfully"
      assert html =~ "some updated description"
    end

    test "deletes barber_job in listing", %{conn: conn, barber_job: barber_job} do
      {:ok, index_live, _html} = live(conn, Routes.barber_job_index_path(conn, :index))

      assert index_live |> element("#barber_job-#{barber_job.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#barber_job-#{barber_job.id}")
    end
  end

  describe "Show" do
    setup [:create_barber_job]

    test "displays barber_job", %{conn: conn, barber_job: barber_job} do
      {:ok, _show_live, html} = live(conn, Routes.barber_job_show_path(conn, :show, barber_job))

      assert html =~ "Show Barber job"
      assert html =~ barber_job.description
    end

    test "updates barber_job within modal", %{conn: conn, barber_job: barber_job} do
      {:ok, show_live, _html} = live(conn, Routes.barber_job_show_path(conn, :show, barber_job))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Barber job"

      assert_patch(show_live, Routes.barber_job_show_path(conn, :edit, barber_job))

      assert show_live
             |> form("#barber_job-form", barber_job: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#barber_job-form", barber_job: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.barber_job_show_path(conn, :show, barber_job))

      assert html =~ "Barber job updated successfully"
      assert html =~ "some updated description"
    end
  end
end
