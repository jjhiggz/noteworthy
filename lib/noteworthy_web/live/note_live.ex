defmodule NoteworthyWeb.NoteLive do
  use NoteworthyWeb, :live_view

  alias Noteworthy.Notes

  def mount(_params, _session, socket) do
    {:ok, fetch(socket)}
  end

  def handle_event("add-note", %{"note" => note}, socket) do
    Notes.create_note(note)
    {:noreply, fetch(socket)}
  end

  defp fetch(socket) do
    assign(socket, notes: Notes.list_notes())
  end
end
