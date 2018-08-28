# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :telephone_elixir,
  ecto_repos: [TelephoneElixir.Repo]

# Configures the endpoint
config :telephone_elixir, TelephoneElixirWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "+tbi1FvpoJ0c3kbiM5m78Xy+URyzU47PZBOpfuN2nin6dhho/EbVl0aYWyacEg4G",
  render_errors: [view: TelephoneElixirWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: TelephoneElixir.PubSub, adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"
