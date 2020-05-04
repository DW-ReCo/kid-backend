defmodule KidWeb.UserControllerTest do
  use KidWeb.ConnCase

  alias Kid.Accounts.Guardian

  # Set conn struct to have authenticated session for all tests

  setup %{conn: conn} do
    user = insert(:user)

    conn =
      conn
      |> Guardian.Plug.sign_in(user)

    {:ok, conn: conn}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Users"
    end
  end

  describe "new user" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :new))
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "create user" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn2 = post(conn, Routes.user_path(conn, :create), user: params_for(:new_user))

      assert %{id: id} = redirected_params(conn2)
      assert redirected_to(conn2) == Routes.user_path(conn, :show, id)

      conn3 = get(conn, Routes.user_path(conn, :show, id))
      assert html_response(conn3, 200) =~ "Show User"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      params = %{params_for(:new_user) | email: nil}
      conn = post(conn, Routes.user_path(conn, :create), user: params)
      assert html_response(conn, 200) =~ "New User"
    end
  end

  describe "edit user" do
    setup [:create_user]

    test "renders form for editing chosen user", %{conn: conn, user: user} do
      conn = get(conn, Routes.user_path(conn, :edit, user.id))
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "update user" do
    setup [:create_user]

    test "redirects when data is valid", %{conn: conn, user: user} do
      params = params_for(:new_user)
      conn2 = put(conn, Routes.user_path(conn, :update, user.id), user: params)
      assert redirected_to(conn2) == Routes.user_path(conn, :show, user.id)

      conn3 = get(conn, Routes.user_path(conn, :show, user.id))
      assert html_response(conn3, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      params = %{params_for(:new_user) | email: nil}
      conn = put(conn, Routes.user_path(conn, :update, user.id), user: params)
      assert html_response(conn, 200) =~ "Edit User"
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn2 = delete(conn, Routes.user_path(conn, :delete, user.id))
      assert redirected_to(conn2) == Routes.user_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user.id))
      end
    end
  end

  defp create_user(_) do
    user = insert(:user)
    {:ok, user: user}
  end
end
