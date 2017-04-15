defmodule MultiRepos.Context2.Repo.Migrations.AddTableA do
  use Ecto.Migration

  def change do
    create table(:context2_table_a) do
      add :name,  :string
      timestamps()
    end
  end
end
