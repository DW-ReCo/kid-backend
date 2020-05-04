defmodule KidWeb.PageController do
  use KidWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
