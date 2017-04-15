# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :multi_repos,
  ecto_repos: [MultiRepos.Repo]

# Configures the endpoint
config :multi_repos, MultiRepos.Web.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "lWZ6P5NOed3vW8AXquG9gCkJLxlSEoJOGZ7k2LI6jmPQb9nRF4pI0EwimHZjt9ML",
  render_errors: [view: MultiRepos.Web.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MultiRepos.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
