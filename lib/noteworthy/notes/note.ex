defmodule Noteworthy.Notes.Note do
  use Ecto.Schema
  import Ecto.Changeset

  schema "notes" do
    field :content, :string
    field :done, :boolean, default: false
    field :title, :string
    belongs_to :user, Noteworthy.Accounts.User
    timestamps()
  end

  @doc false
  def changeset(note, attrs) do
    note
    |> cast(attrs, [:title, :content, :done])
    |> validate_required([:title, :content, :done])
  end
end
