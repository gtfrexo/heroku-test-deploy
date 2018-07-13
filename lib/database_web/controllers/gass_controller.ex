defmodule DatabaseWeb.GassController do
  use DatabaseWeb, :controller

  alias Database.Gasss
  alias Database.Gasss.Gass

  action_fallback DatabaseWeb.FallbackController

  def index(conn, _params) do
    gasss = Gasss.list_gasss()
    render(conn, "index.json", gasss: gasss)
  end

  def create(conn, %{"gass" => gass_params}) do
    with {:ok, %Gass{} = gass} <- Gasss.create_gass(gass_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", gass_path(conn, :show, gass))
      |> render("show.json", gass: gass)
    end
  end

  def show(conn, %{"id" => id}) do
    gass = Gasss.get_gass!(id)
    render(conn, "show.json", gass: gass)
  end

  def update(conn, %{"id" => id, "gass" => gass_params}) do
    gass = Gasss.get_gass!(id)

    with {:ok, %Gass{} = gass} <- Gasss.update_gass(gass, gass_params) do
      render(conn, "show.json", gass: gass)
    end
  end

  def delete(conn, %{"id" => id}) do
    gass = Gasss.get_gass!(id)
    with {:ok, %Gass{}} <- Gasss.delete_gass(gass) do
      send_resp(conn, :no_content, "")
    end
  end
end
