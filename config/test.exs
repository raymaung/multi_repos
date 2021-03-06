use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :multi_repos, MultiRepos.Web.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :multi_repos, MultiRepos.Context1.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "context1_test",
  hostname: "localhost",
  priv: "priv/context1_repo",
  pool_size: 10

config :multi_repos, MultiRepos.Context2.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "context2_test",
  hostname: "localhost",
  priv: "priv/context2_repo",
  pool_size: 10
