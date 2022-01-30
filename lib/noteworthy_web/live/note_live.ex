defmodule NoteworthyWeb.NoteLive do
  use NoteworthyWeb, :live_view

  alias Noteworthy.Notes
  alias Noteworthy.Notes.Note

  def mount(_params, _session, socket) do
    {:ok, initialize(socket)}
  end

  def handle_event("add-note", %{"note" => note}, socket) do
    Notes.create_note(note)
    {:noreply, fetch(socket)}
  end

  def handle_event("delete-note", %{"note_id" => note_id_string}, socket) do
    {note_id, ""} = note_id_string |> Integer.parse()

    Noteworthy.Notes.delete_note(%Note{
      id: note_id
    })

    "note_id" |> IO.inspect()
    note_id |> IO.inspect()
    {:noreply, fetch(socket)}
  end

  def handle_event("toggle-show-create-note", _, socket) do
    {:noreply, assign(socket, show_create_note: !socket.assigns.show_create_note)}
  end

  def handle_event("toggle-show-note-list", _, socket) do
    {:noreply, assign(socket, show_note_list: !socket.assigns.show_note_list)}
  end

  defp fetch(socket) do
    assign(socket, notes: Notes.list_notes())
  end

  defp initialize(socket) do
    assign(socket, notes: Notes.list_notes(), show_create_note: false, show_note_list: false)
  end
end
