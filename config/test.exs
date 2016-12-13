use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :joyvote, Joyvote.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :joyvote, Joyvote.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "joyvote_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :guardian, Guardian,
  allowed_algos: ["HS512"], # optional
  verify_module: Guardian.JWT,  # optional
  issuer: "Joyvote",
  ttl: { 30, :days },
  verify_issuer: true, # optional
  secret_key: %{"k" => "UW8mE4w32oRAGfqcv5kh1w", "kty" => "oct"},
  serializer: Joyvote.GuardianSerializer
