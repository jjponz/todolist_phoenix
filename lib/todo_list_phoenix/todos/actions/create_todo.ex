defmodule TodoListPhoenix.Todos.Actions do
  import Ecto.Query, warn: false
  alias TodoListPhoenix.Repo

  alias TodoListPhoenix.Todos.Domain.Todo

  def create_todo(attrs \\ %{}) do
      %Todo{}
      |> Todo.changeset(attrs)
      |> Repo.insert()
    end

end
