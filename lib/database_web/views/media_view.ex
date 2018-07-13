defmodule DatabaseWeb.MediaView do
  use DatabaseWeb, :view
  alias DatabaseWeb.MediaView

  def render("index.json", %{medias: medias}) do
    %{data: render_many(medias, MediaView, "media.json")}
  end

  def render("show.json", %{media: media}) do
    %{data: render_one(media, MediaView, "media.json")}
  end

  def render("media.json", %{media: media}) do
    %{id: media.id,
      deleted_at: media.deleted_at,
      description: media.description,
      media_type: media.media_type,
      url: media.url,
      venue_id: media.venue_id,
      event_id: media.event_id
    }
  end
end
