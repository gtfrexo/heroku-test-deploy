defmodule DatabaseWeb.ProfileContentController do
  use DatabaseWeb, :controller

  alias Database.ProfileContents
  alias Database.ProfileContents.ProfileContent

  action_fallback DatabaseWeb.FallbackController

  def index(conn, _params) do
    profilecontents = ProfileContents.list_profilecontents()
    render(conn, "index.json", profilecontents: profilecontents)
  end

  def create(conn, %{"profile_content" => profile_content_params}) do
    with {:ok, %ProfileContent{} = profile_content} <- ProfileContents.create_profile_content(profile_content_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", profile_content_path(conn, :show, profile_content))
      |> render("show.json", profile_content: profile_content)
    end
  end

  def show(conn, %{"id" => id}) do
    profile_content = ProfileContents.get_profile_content!(id)
    render(conn, "show.json", profile_content: profile_content)
  end

  def update(conn, %{"id" => id, "profile_content" => profile_content_params}) do
    profile_content = ProfileContents.get_profile_content!(id)

    with {:ok, %ProfileContent{} = profile_content} <- ProfileContents.update_profile_content(profile_content, profile_content_params) do
      render(conn, "show.json", profile_content: profile_content)
    end
  end

  def delete(conn, %{"id" => id}) do
    profile_content = ProfileContents.get_profile_content!(id)
    with {:ok, %ProfileContent{}} <- ProfileContents.delete_profile_content(profile_content) do
      send_resp(conn, :no_content, "")
    end
  end
end
