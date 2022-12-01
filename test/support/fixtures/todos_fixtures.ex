defmodule TodoListPhoenix.TodosFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TodoListPhoenix.Todos` context.
  """

  @doc """
  Generate a todo.
  """
  def todo_fixture(attrs \\ %{}) do
    {:ok, todo} =
      attrs
      |> Enum.into(%{
        description: "some description",
        name: "some name"
      })
      |> TodoListPhoenix.Todos.Actions.create_todo()

    todo
  end
end
