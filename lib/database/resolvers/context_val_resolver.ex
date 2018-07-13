defmodule Database.ContextValResolver do
    
    alias Database.ContextVals

    def all(_args, _info) do
        {:ok, ContextVals.list_contextvals}
    end

    def find(%{id: id}, _info) do
        case ContextVals.get_context_val!(id) do
            nil -> {:error, "Context Value with id: #{id} not found."}
            context_val -> {:ok, context_val}
        end
    end

    def create(args, _info) do
        ContextVals.create_context_val(args)
    end

    def update(%{id: id, context_val: context_val_params}, _info) do
        ContextVals.get_context_val!(id)
        |> ContextVals.update_context_val(context_val_params)
    end

    def delete(%{id: id}, _info) do
        ContextVals.get_context_val!(id)
        |> ContextVals.delete_context_val
    end

end