defmodule Noteworthy.Repo.Migrations.AddUserRole do
  use Ecto.Migration

  def change do
    alter table("users") do
      add :role, :string, null: false, default: "user"
    end
  end
end
