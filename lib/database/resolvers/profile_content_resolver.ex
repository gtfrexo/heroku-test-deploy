defmodule Database.ProfileContentResolver do
    
    alias Database.ProfileContents

    def all(_args, _info) do
        {:ok, ProfileContents.list_profilecontents}
    end

    def find(%{id: id}, _info) do
        case ProfileContents.get_profile_content!(id) do
            nil -> {:error, "Profile Content with id: #{id} not found."}
            profile_content -> {:ok, profile_content}
        end
    end

    def create(args, _info) do
        ProfileContents.create_profile_content(args)
    end

    def update(%{id: id, profile_content: profile_content_params}, _info) do
        ProfileContents.get_profile_content!(id)
        |> ProfileContents.update_profile_content(profile_content_params)
    end

    def delete(%{id: id}, _info) do
        ProfileContents.get_profile_content!(id)
        |> ProfileContents.delete_profile_content
    end


end