defmodule KidWeb.PageControllerTest do
  use KidWeb.ConnCase
  alias Kid.Accounts.Guardian

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")

    assert html_response(conn, 200) =~ ""
  end

  # Test unauthenticated access
  test "GET /dashboard unauthenticated", %{conn: conn} do
    conn = get(conn, "/dashboard")

    assert response(conn, 401)
  end

  # Test authenticated access
  test "GET /dashboard authenticated", %{conn: conn} do
    user = insert(:user)

    conn =
      conn
      |> Guardian.Plug.sign_in(user)
      |> get(Routes.page_path(conn, :dashboard))

    assert html_response(conn, 200) =~ "Logged in as"
  end
end
