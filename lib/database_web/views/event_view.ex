defmodule DatabaseWeb.EventView do
  use DatabaseWeb, :view
  alias DatabaseWeb.EventView

  def render("index.json", %{events: events}) do
    %{data: render_many(events, EventView, "event.json")}
  end

  def render("show.json", %{event: event}) do
    %{data: render_one(event, EventView, "event.json")}
  end

  def render("event.json", %{event: event}) do
    %{id: event.id,
      category: event.category,
      description: event.description,
      end_time: event.end_time,
      start_time: event.start_time,
      title: event.title,
      title_full: event.title_full,
      created_by: event.created_by,
      location_id: event.location_id,
      pic: event.pic,
      created_at: event.created_id,
      pool_id: event.pool_id,
      host_id: event.host_id
    }
  end
end
