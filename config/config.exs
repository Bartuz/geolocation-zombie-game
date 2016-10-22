# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :zombie,
  ecto_repos: [Zombie.Repo]

# Configures the endpoint
config :zombie, Zombie.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "hQXW8VCXM3CDBF516rGa+v7dA7IGpI2fYdGdsy2ZB4WFc4lTrAjQ5hlwnF7kUyuS",
  render_errors: [view: Zombie.ErrorView, accepts: ~w(html json)],
  pubsub: [name: Zombie.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"

# %% Coherence Configuration %%   Don't remove this line
config :coherence,
  user_schema: Zombie.User,
  repo: Zombie.Repo,
  module: Zombie,
  logged_out_url: "/",
  email_from: {"Your Name", "yourname@example.com"},
  opts: [:authenticatable, :recoverable, :lockable, :trackable, :unlockable_with_token, :registerable]

config :coherence, Zombie.Coherence.Mailer,
  adapter: Swoosh.Adapters.Sendgrid,
  api_key: "your api key here"
# %% End Coherence Configuration %%
