defmodule DatabaseWeb.PersonView do
  use DatabaseWeb, :view
  alias DatabaseWeb.PersonView

  def render("index.json", %{persons: persons}) do
    %{data: render_many(persons, PersonView, "person.json")}
  end

  def render("show.json", %{person: person}) do
    %{data: render_one(person, PersonView, "person.json")}
  end

  def render("person.json", %{person: person}) do
    %{id: person.id,
      birthday: person.birthday,
      email: person.email,
      gender: person.gender_id,
      name: person.name,
      name_full: person.name_full,
      target_gender: person.target_gender,
      target_relationship: person.target_relationship,
      token: person.token,
      id_token: person.id_token,
      auth_token: person.auth_token,
      email_verified: person.email_verified,
      profile_content_id: person.profile_content_id,
      profile_pic: person.profile_pic,
      auth0_me_id: person.auth0_me_id,
      bio: person.bio
      }
  end
end
