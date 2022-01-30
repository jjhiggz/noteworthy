defmodule NoteworthyWeb.PageController do
  use NoteworthyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
