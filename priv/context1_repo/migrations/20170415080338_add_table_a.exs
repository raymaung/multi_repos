defmodule MultiRepos.Context1.Repo.Migrations.AddTableA do
  use Ecto.Migration

  def change do
    create table(:context1_table_a) do
      add :name,  :string
      timestamps()
    end
  end
end
