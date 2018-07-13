defmodule DatabaseWeb.PassView do
  use DatabaseWeb, :view
  alias DatabaseWeb.PassView

  def render("index.json", %{passs: passs}) do
    %{data: render_many(passs, PassView, "pass.json")}
  end

  def render("show.json", %{pass: pass}) do
    %{data: render_one(pass, PassView, "pass.json")}
  end

  def render("pass.json", %{pass: pass}) do
    %{id: pass.id,
      events_created: pass.events_created,
      messages_recieved: pass.messages_recieved,
      messages_sent: pass.messages_sent,
      pools_joined: pass.pools_joined,
      started_chats: pass.started_chats,
      age: pass.age,
      person_id: pass.person_id
    }
  end
end
