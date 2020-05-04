defmodule KidWeb.PageController do
  use KidWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def dashboard(conn, _params) do
    user = Guardian.Plug.current_resource(conn)
    render(conn, "dashboard.html", current_user: user)
  end
end
