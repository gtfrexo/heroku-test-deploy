defmodule DatabaseWeb.FileView do
  use DatabaseWeb, :view
  alias DatabaseWeb.FileView

  def render("index.json", %{files: files}) do
    %{data: render_many(files, FileView, "file.json")}
  end

  def render("show.json", %{file: file}) do
    %{data: render_one(file, FileView, "file.json")}
  end

  def render("file.json", %{file: file}) do
    %{id: file.id,
      content_type: file.content_type,
      name: file.name,
      name_full: file.name_full,
      secret: file.secret,
      size: file.size,
      url: file.url}
  end
end
