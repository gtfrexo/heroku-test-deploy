defmodule DatabaseWeb.PalsView do
  use DatabaseWeb, :view
  alias DatabaseWeb.PalsView

  def render("index.json", %{palss: palss}) do
    %{data: render_many(palss, PalsView, "pals.json")}
  end

  def render("show.json", %{pals: pals}) do
    %{data: render_one(pals, PalsView, "pals.json")}
  end

  def render("pals.json", %{pals: pals}) do
    %{id: pals.id,
      events_created: pals.events_created,
      messages_total: pals.messages_total,
      pools_joined: pals.pools_joined,
      started_chats: pals.started_chats}
  end
end
