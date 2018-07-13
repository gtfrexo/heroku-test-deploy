defmodule DatabaseWeb.PalsController do
  use DatabaseWeb, :controller

  alias Database.Palss
  alias Database.Palss.Pals

  action_fallback DatabaseWeb.FallbackController

  def index(conn, _params) do
    palss = Palss.list_palss()
    render(conn, "index.json", palss: palss)
  end

  def create(conn, %{"pals" => pals_params}) do
    with {:ok, %Pals{} = pals} <- Palss.create_pals(pals_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", pals_path(conn, :show, pals))
      |> render("show.json", pals: pals)
    end
  end

  def show(conn, %{"id" => id}) do
    pals = Palss.get_pals!(id)
    render(conn, "show.json", pals: pals)
  end

  def update(conn, %{"id" => id, "pals" => pals_params}) do
    pals = Palss.get_pals!(id)

    with {:ok, %Pals{} = pals} <- Palss.update_pals(pals, pals_params) do
      render(conn, "show.json", pals: pals)
    end
  end

  def delete(conn, %{"id" => id}) do
    pals = Palss.get_pals!(id)
    with {:ok, %Pals{}} <- Palss.delete_pals(pals) do
      send_resp(conn, :no_content, "")
    end
  end
end
