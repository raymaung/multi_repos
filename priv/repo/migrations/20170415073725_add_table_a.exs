defmodule MultiRepos.Repo.Migrations.AddTableA do
  use Ecto.Migration

  def change do
    create table(:weather) do
      add :name,  :string
      timestamps()
    end
  end
end
