defmodule DatabaseWeb.PassController do
  use DatabaseWeb, :controller

  alias Database.Passs
  alias Database.Passs.Pass

  action_fallback DatabaseWeb.FallbackController

  def index(conn, _params) do
    passs = Passs.list_passs()
    render(conn, "index.json", passs: passs)
  end

  def create(conn, %{"pass" => pass_params}) do
    with {:ok, %Pass{} = pass} <- Passs.create_pass(pass_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", pass_path(conn, :show, pass))
      |> render("show.json", pass: pass)
    end
  end

  def show(conn, %{"id" => id}) do
    pass = Passs.get_pass!(id)
    render(conn, "show.json", pass: pass)
  end

  def update(conn, %{"id" => id, "pass" => pass_params}) do
    pass = Passs.get_pass!(id)

    with {:ok, %Pass{} = pass} <- Passs.update_pass(pass, pass_params) do
      render(conn, "show.json", pass: pass)
    end
  end

  def delete(conn, %{"id" => id}) do
    pass = Passs.get_pass!(id)
    with {:ok, %Pass{}} <- Passs.delete_pass(pass) do
      send_resp(conn, :no_content, "")
    end
  end
end
