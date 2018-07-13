defmodule DatabaseWeb.GalsView do
  use DatabaseWeb, :view
  alias DatabaseWeb.GalsView

  def render("index.json", %{galss: galss}) do
    %{data: render_many(galss, GalsView, "gals.json")}
  end

  def render("show.json", %{gals: gals}) do
    %{data: render_one(gals, GalsView, "gals.json")}
  end

  def render("gals.json", %{gals: gals}) do
    %{id: gals.id,
      created_events: gals.created_events,
      event_clicked: gals.event_clicked,
      influenced_chats: gals.influenced_chats,
      pool_clicked: gals.pool_clicked}
  end
end
