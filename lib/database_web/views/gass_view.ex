defmodule DatabaseWeb.GassView do
  use DatabaseWeb, :view
  alias DatabaseWeb.GassView

  def render("index.json", %{gasss: gasss}) do
    %{data: render_many(gasss, GassView, "gass.json")}
  end

  def render("show.json", %{gass: gass}) do
    %{data: render_one(gass, GassView, "gass.json")}
  end

  def render("gass.json", %{gass: gass}) do
    %{id: gass.id,
      event_clicked: gass.event_clicked,
      pool_clicked: gass.pool_clicked,
      created_events: gass.created_events,
      influenced_chats: gass.influenced_chats}
  end
end
