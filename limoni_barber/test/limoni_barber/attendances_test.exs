defmodule LimoniBarber.AttendancesTest do
  use LimoniBarber.DataCase

  alias LimoniBarber.Attendances

  describe "patients" do
    alias LimoniBarber.Attendances.Patient

    import LimoniBarber.AttendancesFixtures

    @invalid_attrs %{description: nil, email: nil, name: nil, phone: nil}

    test "list_patients/0 returns all patients" do
      patient = patient_fixture()
      assert Attendances.list_patients() == [patient]
    end

    test "get_patient!/1 returns the patient with given id" do
      patient = patient_fixture()
      assert Attendances.get_patient!(patient.id) == patient
    end

    test "create_patient/1 with valid data creates a patient" do
      valid_attrs = %{description: "some description", email: "some email", name: "some name", phone: "some phone"}

      assert {:ok, %Patient{} = patient} = Attendances.create_patient(valid_attrs)
      assert patient.description == "some description"
      assert patient.email == "some email"
      assert patient.name == "some name"
      assert patient.phone == "some phone"
    end

    test "create_patient/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attendances.create_patient(@invalid_attrs)
    end

    test "update_patient/2 with valid data updates the patient" do
      patient = patient_fixture()
      update_attrs = %{description: "some updated description", email: "some updated email", name: "some updated name", phone: "some updated phone"}

      assert {:ok, %Patient{} = patient} = Attendances.update_patient(patient, update_attrs)
      assert patient.description == "some updated description"
      assert patient.email == "some updated email"
      assert patient.name == "some updated name"
      assert patient.phone == "some updated phone"
    end

    test "update_patient/2 with invalid data returns error changeset" do
      patient = patient_fixture()
      assert {:error, %Ecto.Changeset{}} = Attendances.update_patient(patient, @invalid_attrs)
      assert patient == Attendances.get_patient!(patient.id)
    end

    test "delete_patient/1 deletes the patient" do
      patient = patient_fixture()
      assert {:ok, %Patient{}} = Attendances.delete_patient(patient)
      assert_raise Ecto.NoResultsError, fn -> Attendances.get_patient!(patient.id) end
    end

    test "change_patient/1 returns a patient changeset" do
      patient = patient_fixture()
      assert %Ecto.Changeset{} = Attendances.change_patient(patient)
    end
  end

  describe "attendances" do
    alias LimoniBarber.Attendances.Attendance

    import LimoniBarber.AttendancesFixtures

    @invalid_attrs %{canceled_at: nil, finished_at: nil, schedule: nil, status: nil}

    test "list_attendances/0 returns all attendances" do
      attendance = attendance_fixture()
      assert Attendances.list_attendances() == [attendance]
    end

    test "get_attendance!/1 returns the attendance with given id" do
      attendance = attendance_fixture()
      assert Attendances.get_attendance!(attendance.id) == attendance
    end

    test "create_attendance/1 with valid data creates a attendance" do
      valid_attrs = %{canceled_at: ~U[2022-07-15 22:28:00Z], finished_at: ~U[2022-07-15 22:28:00Z], schedule: ~U[2022-07-15 22:28:00Z], status: :scheduled}

      assert {:ok, %Attendance{} = attendance} = Attendances.create_attendance(valid_attrs)
      assert attendance.canceled_at == ~U[2022-07-15 22:28:00Z]
      assert attendance.finished_at == ~U[2022-07-15 22:28:00Z]
      assert attendance.schedule == ~U[2022-07-15 22:28:00Z]
      assert attendance.status == :scheduled
    end

    test "create_attendance/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Attendances.create_attendance(@invalid_attrs)
    end

    test "update_attendance/2 with valid data updates the attendance" do
      attendance = attendance_fixture()
      update_attrs = %{canceled_at: ~U[2022-07-16 22:28:00Z], finished_at: ~U[2022-07-16 22:28:00Z], schedule: ~U[2022-07-16 22:28:00Z], status: :canceled}

      assert {:ok, %Attendance{} = attendance} = Attendances.update_attendance(attendance, update_attrs)
      assert attendance.canceled_at == ~U[2022-07-16 22:28:00Z]
      assert attendance.finished_at == ~U[2022-07-16 22:28:00Z]
      assert attendance.schedule == ~U[2022-07-16 22:28:00Z]
      assert attendance.status == :canceled
    end

    test "update_attendance/2 with invalid data returns error changeset" do
      attendance = attendance_fixture()
      assert {:error, %Ecto.Changeset{}} = Attendances.update_attendance(attendance, @invalid_attrs)
      assert attendance == Attendances.get_attendance!(attendance.id)
    end

    test "delete_attendance/1 deletes the attendance" do
      attendance = attendance_fixture()
      assert {:ok, %Attendance{}} = Attendances.delete_attendance(attendance)
      assert_raise Ecto.NoResultsError, fn -> Attendances.get_attendance!(attendance.id) end
    end

    test "change_attendance/1 returns a attendance changeset" do
      attendance = attendance_fixture()
      assert %Ecto.Changeset{} = Attendances.change_attendance(attendance)
    end
  end
end
