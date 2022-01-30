defmodule NoteworthyWeb.ViewNoteLive do
  use NoteworthyWeb, :live_view

  alias Noteworthy.Notes

  def mount(%{"id" => id}, _session, socket) do
    {:ok, fetch(socket, id)}
  end

  defp fetch(socket, id) do
    note = Notes.get_note!(id)
    markdown_content = note.content |> IO.inspect()
    html_content = MarkdownParser.parse(markdown_content)
    assign(socket, note: note, html_content: html_content)
  end
end
