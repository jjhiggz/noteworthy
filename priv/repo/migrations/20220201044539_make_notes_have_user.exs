defmodule Noteworthy.Repo.Migrations.MakeNotesHaveUser do
  use Ecto.Migration

  def up do
    alter table(:notes) do
      remove :user_id
      add :user_id, references(:users), null: false
    end
  end

  def down do
    alter table(:notes) do
      remove :user_id
      add :user_id, references(:users)
    end
  end
end
