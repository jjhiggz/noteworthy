defmodule Noteworthy.Repo.Migrations.CreateNotes do
  use Ecto.Migration

  def change do
    create table(:notes) do
      add :title, :string
      add :content, :text
      add :done, :boolean, default: false, null: false

      timestamps()
    end
  end
end
