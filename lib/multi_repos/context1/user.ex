defmodule MultiRepos.Context1.User do
  use Ecto.Schema

  schema "context1_users" do
    field :name, :string

    timestamps()
  end
end
