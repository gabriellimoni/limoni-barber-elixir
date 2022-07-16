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

  describe "barber_jobs" do
    alias LimoniBarber.Barbers.BarberJob

    import LimoniBarber.BarbersFixtures

    @invalid_attrs %{description: nil, name: nil, price_in_cents: nil}

    test "list_barber_jobs/0 returns all barber_jobs" do
      barber_job = barber_job_fixture()
      assert Barbers.list_barber_jobs() == [barber_job]
    end

    test "get_barber_job!/1 returns the barber_job with given id" do
      barber_job = barber_job_fixture()
      assert Barbers.get_barber_job!(barber_job.id) == barber_job
    end

    test "create_barber_job/1 with valid data creates a barber_job" do
      valid_attrs = %{description: "some description", name: "some name", price_in_cents: 42}

      assert {:ok, %BarberJob{} = barber_job} = Barbers.create_barber_job(valid_attrs)
      assert barber_job.description == "some description"
      assert barber_job.name == "some name"
      assert barber_job.price_in_cents == 42
    end

    test "create_barber_job/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Barbers.create_barber_job(@invalid_attrs)
    end

    test "update_barber_job/2 with valid data updates the barber_job" do
      barber_job = barber_job_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name", price_in_cents: 43}

      assert {:ok, %BarberJob{} = barber_job} = Barbers.update_barber_job(barber_job, update_attrs)
      assert barber_job.description == "some updated description"
      assert barber_job.name == "some updated name"
      assert barber_job.price_in_cents == 43
    end

    test "update_barber_job/2 with invalid data returns error changeset" do
      barber_job = barber_job_fixture()
      assert {:error, %Ecto.Changeset{}} = Barbers.update_barber_job(barber_job, @invalid_attrs)
      assert barber_job == Barbers.get_barber_job!(barber_job.id)
    end

    test "delete_barber_job/1 deletes the barber_job" do
      barber_job = barber_job_fixture()
      assert {:ok, %BarberJob{}} = Barbers.delete_barber_job(barber_job)
      assert_raise Ecto.NoResultsError, fn -> Barbers.get_barber_job!(barber_job.id) end
    end

    test "change_barber_job/1 returns a barber_job changeset" do
      barber_job = barber_job_fixture()
      assert %Ecto.Changeset{} = Barbers.change_barber_job(barber_job)
    end
  end
end
