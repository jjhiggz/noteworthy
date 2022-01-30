defmodule NoteworthyWeb.ViewNoteLive do
  use NoteworthyWeb, :live_view
  alias Noteworthy.Notes

  def mount(%{"id" => id}, _session, socket) do
    {:ok, fetch(socket, id)}
  end

  defp fetch(socket, id) do
    note = Notes.get_note!(id)
    assign(socket, note: note)
  end
end
