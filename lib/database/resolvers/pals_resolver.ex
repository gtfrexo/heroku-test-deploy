defmodule Database.PalsResolver do
    
    alias Database.Palss

    def all(_args, _info) do
        {:ok, Palss.list_palss}
    end

    def find(%{id: id}, _info) do
        case Palss.get_pals!(id) do
            nil -> {:error, "Pals id: #{id} not found."}
            pals -> {:ok, pals}
        end
    end

    def create(args, _info) do
        Palss.create_pals(args)
    end

    def update(%{id: id, pals: pals_params}, _info) do
        Palss.get_pals!(id)
        |> Palss.update_pals(pals_params)
    end

    def delete(%{id: id}, _info) do
        Palss.get_pals!(id)
        |> Palss.delete_pals
    end


end