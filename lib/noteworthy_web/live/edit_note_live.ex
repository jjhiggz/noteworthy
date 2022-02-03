defmodule NoteworthyWeb.EditNoteLive do
  use NoteworthyWeb, :live_view
  alias Noteworthy.Notes
  alias Noteworthy.Accounts

  def mount(%{"id" => id}, session, socket) do
    user = session["user_token"] |> Accounts.get_user_by_session_token()
    {:ok, fetch(assign(socket, user: user), id)}
  end

  def handle_event("save-note", %{"note" => update_note}, socket) do
    Notes.update_note(socket.assigns.note, %{
      content: update_note["content"],
      title: update_note["title"],
      user_id: socket.assigns.user.id
    })

    {:noreply, fetch(socket, socket.assigns.note.id)}
  end

  defp fetch(socket, id) do
    note = Notes.get_note!(id)
    assign(socket, note: note)
  end
end
