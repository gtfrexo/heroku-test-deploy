defmodule Database.ChatResolver do
    
    alias Database.Chats

    def all(_args, _info) do
        {:ok, Chats.list_chats}
    end

    def find(%{id: id}, _info) do
        case Chats.get_chat!(id) do
            nil -> {:error, "Chat with id: #{id} not found."}
            chat -> {:ok, chat}
        end
    end

    def create(args, _info) do
        Chats.create_chat(args)
    end

    def update(%{id: id, chat: chat_params}, _info) do
        Chats.get_chat!(id)
        |> Chats.update_chat(chat_params)
    end

    def delete(%{id: id}, _info) do
        Chats.get_chat!(id)
        |> Chats.delete_chat
    end

end