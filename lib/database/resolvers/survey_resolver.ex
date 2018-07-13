defmodule Database.SurveyResolver do
    
    alias Database.Surveys

    def all(_args, _info) do
        {:ok, Surveys.list_surveys}
    end

    def find(%{id: id}, _info) do
        case Surveys.get_survey!(id) do
            nil -> {:error, "Survey with id: #{id} not found."}
            survey -> {:ok, survey}
        end
    end

    def create(args, _info) do
        Surveys.create_survey(args)
    end

    def update(%{id: id, survey: survey_params}, _info) do
        Surveys.get_survey!(id)
        |> Surveys.update_survey(survey_params)
    end

    def delete(%{id: id}, _info) do
        Surveys.get_survey!(id)
        |> Surveys.delete_survey
    end


end