defmodule TodoListPhoenix.Todos.Actions.ListTodos do
  import Ecto.Query, warn: false
  alias TodoListPhoenix.Repo

  alias TodoListPhoenix.Todos.Domain.Todo

  def execute do
    Repo.all(Todo)
  end
end
