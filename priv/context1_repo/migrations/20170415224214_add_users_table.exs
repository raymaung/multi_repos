defmodule MultiRepos.Context1.Repo.Migrations.AddUsersTable do
  use Ecto.Migration

  def change do
    create table(:context1_users) do
      add :name,  :string
      timestamps()
    end
  end
end
