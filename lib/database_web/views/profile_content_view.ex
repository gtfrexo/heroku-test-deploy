defmodule DatabaseWeb.ProfileContentView do
  use DatabaseWeb, :view
  alias DatabaseWeb.ProfileContentView

  def render("index.json", %{profilecontents: profilecontents}) do
    %{data: render_many(profilecontents, ProfileContentView, "profile_content.json")}
  end

  def render("show.json", %{profile_content: profile_content}) do
    %{data: render_one(profile_content, ProfileContentView, "profile_content.json")}
  end

  def render("profile_content.json", %{profile_content: profile_content}) do
    %{id: profile_content.id,
      education_blurb: profile_content.education_blurb,
      occupation_blurb: profile_content.occupation_blurb,
      boat_blurb: profile_content.boat_blurb,
      eggs_blurb: profile_content.eggs_blurb,
      animal_blurb: profile_content.animal_blurb,
      worst_pickup_blurb: profile_content.worst_pickup_blurb,
      emoji_blurb: profile_content.emoji_blurb,
      person_id: profile_content.person_id
    }
  end
end
