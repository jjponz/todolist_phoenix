defmodule TodoListPhoenix.Todos.Actions.CreateTodo do
  import Ecto.Query, warn: false
  alias TodoListPhoenix.Repo

  alias TodoListPhoenix.Todos.Domain.Todo

  def execute(attrs \\ %{}) do
      %Todo{}
      |> Todo.changeset(attrs)
      |> Repo.insert()
    end

end
