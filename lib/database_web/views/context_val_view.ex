defmodule DatabaseWeb.ContextValView do
  use DatabaseWeb, :view
  alias DatabaseWeb.ContextValView

  def render("index.json", %{contextvals: contextvals}) do
    %{data: render_many(contextvals, ContextValView, "context_val.json")}
  end

  def render("show.json", %{context_val: context_val}) do
    %{data: render_one(context_val, ContextValView, "context_val.json")}
  end

  def render("context_val.json", %{context_val: context_val}) do
    %{id: context_val.id,
      education_blurb: context_val.education_blurb,
      occupation_blurb: context_val.occupation_blurb,
      boat_blurb: context_val.boat_blurb,
      eggs_blurb: context_val.eggs_blurb,
      animal_blurb: context_val.animal_blurb,
      worst_pickup_blurb: context_val.worst_pickup_blurb,
      emoji_blurb: context_val.emoji_blurb
    }
  end
end
