# KID-Backend

# Dependencies

- Erlang 22.3.3
- Elixir 1.9.4 

A recommended way to set up these dependencies is using [asdf](https://asdf-vm.com/#/) to install and manage global and local Erlang and Elixir installations.

KID will use the phoenix framework:
- Phoenix v1.5.1 ([https://hexdocs.pm/phoenix/installation.html](https://hexdocs.pm/phoenix/installation.html))

A few other dependencies needed are:
- Node.js
- PostgreSQL
- On Linux: inotify-tools
- blackbox ([https://github.com/StackExchange/blackbox](https://github.com/StackExchange/blackbox))

# Run KID-Backend

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.setup`
  * Install Node.js dependencies with `cd assets && npm install`
  * Start Phoenix endpoint with `mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: https://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Forum: https://elixirforum.com/c/phoenix-forum
  * Source: https://github.com/phoenixframework/phoenix
