defmodule NoteworthyWeb.EditNoteLive do
  use NoteworthyWeb, :live_view
  alias Noteworthy.Notes.Note
  alias Noteworthy.Notes

  def mount(%{"id" => id}, _session, socket) do
    {:ok, fetch(socket, id)}
  end

  def handle_event("save-note", %{"note" => update_note}, socket) do
    Notes.update_note(socket.assigns.note, %{
      content: update_note["content"],
      title: update_note["title"]
    })

    {:noreply, fetch(socket.assigns.note, socket.note.id)}
  end

  defp fetch(socket, id) do
    note = Notes.get_note!(id)
    assign(socket, note: note)
  end
end
