defmodule DatabaseWeb.SurveyView do
  use DatabaseWeb, :view
  alias DatabaseWeb.SurveyView

  def render("index.json", %{surveys: surveys}) do
    %{data: render_many(surveys, SurveyView, "survey.json")}
  end

  def render("show.json", %{survey: survey}) do
    %{data: render_one(survey, SurveyView, "survey.json")}
  end

  def render("survey.json", %{survey: survey}) do
    %{id: survey.id,
      event_attended: survey.event_attended,
      met_someone: survey.met_someone,
      person_id: survey.person_id
    }
  end
end
