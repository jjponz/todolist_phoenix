defmodule TodoListPhoenix.Repo do
  use Ecto.Repo,
    otp_app: :todo_list_phoenix,
    adapter: Ecto.Adapters.Postgres
end
