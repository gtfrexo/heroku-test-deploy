defmodule DatabaseWeb.GalsController do
  use DatabaseWeb, :controller

  alias Database.Galss
  alias Database.Galss.Gals

  action_fallback DatabaseWeb.FallbackController

  def index(conn, _params) do
    galss = Galss.list_galss()
    render(conn, "index.json", galss: galss)
  end

  def create(conn, %{"gals" => gals_params}) do
    with {:ok, %Gals{} = gals} <- Galss.create_gals(gals_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", gals_path(conn, :show, gals))
      |> render("show.json", gals: gals)
    end
  end

  def show(conn, %{"id" => id}) do
    gals = Galss.get_gals!(id)
    render(conn, "show.json", gals: gals)
  end

  def update(conn, %{"id" => id, "gals" => gals_params}) do
    gals = Galss.get_gals!(id)

    with {:ok, %Gals{} = gals} <- Galss.update_gals(gals, gals_params) do
      render(conn, "show.json", gals: gals)
    end
  end

  def delete(conn, %{"id" => id}) do
    gals = Galss.get_gals!(id)
    with {:ok, %Gals{}} <- Galss.delete_gals(gals) do
      send_resp(conn, :no_content, "")
    end
  end
end
