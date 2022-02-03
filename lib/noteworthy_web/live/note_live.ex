defmodule NoteworthyWeb.NoteLive do
  use NoteworthyWeb, :live_view

  alias Noteworthy.Notes
  alias Noteworthy.Notes.Note

  alias Noteworthy.Accounts

  def mount(_params, session, socket) do
    user = session["user_token"] |> Accounts.get_user_by_session_token()
    {:ok, initialize(assign(socket, user: user))}
  end

  def handle_event("add-note", %{"note" => note}, socket) do
    new_note =
      note
      |> Map.put("user_id", socket.assigns.user.id)
      |> IO.inspect()

    Notes.create_note(new_note)

    {:noreply, fetch(socket)}
  end

  def handle_event("delete-note", %{"note_id" => note_id_string}, socket) do
    {note_id, ""} = note_id_string |> Integer.parse()

    Noteworthy.Notes.delete_note(%Note{
      id: note_id
    })

    {:noreply, fetch(socket)}
  end

  def handle_event("toggle-show-create-note", _, socket) do
    {:noreply, assign(socket, show_create_note: !socket.assigns.show_create_note)}
  end

  def handle_event("toggle-show-note-list", _, socket) do
    {:noreply, assign(socket, show_note_list: !socket.assigns.show_note_list)}
  end

  defp get_user(socket) do
    socket.assigns.user
  end

  defp get_notes(user) do
    case user.role do
      "admin" -> Notes.list_notes()
      "user" -> Notes.list_notes_for_user(user)
      _ -> []
    end
  end

  defp fetch(socket) do
    user = socket.assigns.user
    assign(socket, notes: user |> get_notes)
  end

  defp initialize(socket) do
    user = socket.assigns.user

    assign(socket,
      notes: user |> get_notes,
      show_create_note: false,
      show_note_list: true
    )
  end
end
