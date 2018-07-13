defmodule Database.PassResolver do
    
    alias Database.Passs

    def all(_args, _info) do
        {:ok, Passs.list_passs}
    end

    def find(%{id: id}, _info) do
        case Passs.get_pass!(id) do
            nil -> {:error, "Pass id: #{id} not found."}
            pass -> {:ok, pass}
        end
    end

    def create(args, _info) do
        Passs.create_pass(args)
    end

    def update(%{id: id, pass: pass_params}, _info) do
        Passs.get_pass!(id)
        |> Passs.update_pass(pass_params)
    end

    def delete(%{id: id}, _info) do
        Passs.get_pass!(id)
        |> Passs.delete_pass
    end


end