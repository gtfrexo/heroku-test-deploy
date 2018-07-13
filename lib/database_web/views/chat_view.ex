defmodule DatabaseWeb.ChatView do
  use DatabaseWeb, :view
  alias DatabaseWeb.ChatView

  def render("index.json", %{chats: chats}) do
    %{data: render_many(chats, ChatView, "chat.json")}
  end

  def render("show.json", %{chat: chat}) do
    %{data: render_one(chat, ChatView, "chat.json")}
  end

  def render("chat.json", %{chat: chat}) do
    %{id: chat.id,
      is_blocked: chat.is_blocked,
      pool_id: chat.pool_id,
      person_id: chat.person_id
    }
  end
end
