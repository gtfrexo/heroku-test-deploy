defmodule DatabaseWeb.PageController do
  use DatabaseWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
