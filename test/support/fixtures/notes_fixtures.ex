defmodule Noteworthy.NotesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Noteworthy.Notes` context.
  """
  alias Noteworthy.AccountsFixtures

  @doc """
  Generate a note.
  """
  def note_fixture(attrs \\ %{}) do
    user = AccountsFixtures.user_fixture()

    {:ok, note} =
      attrs
      |> Enum.into(%{
        content: "some content",
        done: true,
        title: "some title",
        user_id: user.id
      })
      |> Noteworthy.Notes.create_note()

    note
  end
end
