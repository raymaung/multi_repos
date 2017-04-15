# MultiRepos

It is a standard Phoenix `1.3.0-rc.1` app to experiment with setting up **multiple repos** within the same Phoenix app.

# The Goals

* Two (Phoenix `1.3.x`) contexts
* Each context to have its own Database Repo
* Each Repo to have its own `config` and **migration** files

## Desired Result

* `context1`
    * `context1/context1_repo.ex`
    * `/priv/context1_repo/migrations`
* Same for `context2`

# How-To Steps

* Add a repo, ie. `MultiRepos.Context1.Repo` in the context folder
* Add the repo config for `dev`, `test`, `prod`

    ```
    config :multi_repos, MultiRepos.Context1.Repo,
      adapter: Ecto.Adapters.Postgres,
      username: "postgres",
      password: "postgres",
      database: "context1_dev",
      hostname: "localhost",
      priv: "priv/context1_repo",
      pool_size: 10
    ```
    * **`priv`** option to set the `migrations` folder path
* Add the repo to `:ecto_repos` in `config.exs` for `mix`

    ```
    config :multi_repos,
      ecto_repos: [
        MultiRepos.Context1.Repo,
        MultiRepos.Context2.Repo
      ]
    ```

* Start the repo to the app children in `application.ex`

## Generating Migration For Different Repo

* Include `-r MultiRepos.Context2.Repo` to denote the repo when running `mix` `ecto` tasks, ie

* To generate migration script, `mix ecto.gen.migration add_table_a -r MultiRepos.Context2.Repo`
* To run migration script
    * `mix ecto.migrate` to run all Repos
    * `mix ecto.migrate -r MultiRepos.Context2.Repo`

## Troubleshooting

* Make sure DB User has enouch privileges - `ecto` error message aren't helpful sometime
    * Everything works when the user is
        * `Superuser`
        * `Create databases`


# Generic Phoenix Starting Notes

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
