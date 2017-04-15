defmodule MultiRepos.Context2.User do
  use Ecto.Schema

  schema "context2_users" do
    field :name, :string

    timestamps()
  end
end
