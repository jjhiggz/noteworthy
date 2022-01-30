defmodule Noteworthy.NotesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Noteworthy.Notes` context.
  """

  @doc """
  Generate a note.
  """
  def note_fixture(attrs \\ %{}) do
    {:ok, note} =
      attrs
      |> Enum.into(%{
        content: "some content",
        done: true,
        title: "some title"
      })
      |> Noteworthy.Notes.create_note()

    note
  end
end
