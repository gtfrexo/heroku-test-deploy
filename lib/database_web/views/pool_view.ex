defmodule DatabaseWeb.PoolView do
  use DatabaseWeb, :view
  alias DatabaseWeb.PoolView

  def render("index.json", %{pools: pools}) do
    %{data: render_many(pools, PoolView, "pool.json")}
  end

  def render("show.json", %{pool: pool}) do
    %{data: render_one(pool, PoolView, "pool.json")}
  end

  def render("pool.json", %{pool: pool}) do
    %{id: pool.id,
      event_id: pool.event_id,
      seatgeek_id: pool.seatgeek_id,
      eventbrite_id: pool.eventbrite_id
    }
  end
end
