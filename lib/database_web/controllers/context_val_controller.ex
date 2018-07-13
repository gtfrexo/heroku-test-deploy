defmodule DatabaseWeb.ContextValController do
  use DatabaseWeb, :controller

  alias Database.ContextVals
  alias Database.ContextVals.ContextVal

  action_fallback DatabaseWeb.FallbackController

  def index(conn, _params) do
    contextvals = ContextVals.list_contextvals()
    render(conn, "index.json", contextvals: contextvals)
  end

  def create(conn, %{"context_val" => context_val_params}) do
    with {:ok, %ContextVal{} = context_val} <- ContextVals.create_context_val(context_val_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", context_val_path(conn, :show, context_val))
      |> render("show.json", context_val: context_val)
    end
  end

  def show(conn, %{"id" => id}) do
    context_val = ContextVals.get_context_val!(id)
    render(conn, "show.json", context_val: context_val)
  end

  def update(conn, %{"id" => id, "context_val" => context_val_params}) do
    context_val = ContextVals.get_context_val!(id)

    with {:ok, %ContextVal{} = context_val} <- ContextVals.update_context_val(context_val, context_val_params) do
      render(conn, "show.json", context_val: context_val)
    end
  end

  def delete(conn, %{"id" => id}) do
    context_val = ContextVals.get_context_val!(id)
    with {:ok, %ContextVal{}} <- ContextVals.delete_context_val(context_val) do
      send_resp(conn, :no_content, "")
    end
  end
end
