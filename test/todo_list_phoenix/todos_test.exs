defmodule TodoListPhoenix.TodosTest do
  use TodoListPhoenix.DataCase

  alias TodoListPhoenix.Todos

  describe "todo" do
    alias TodoListPhoenix.Todos.Domain.Todo
    alias TodoListPhoenix.Todos.Actions.CreateTodo

    import TodoListPhoenix.TodosFixtures

    @invalid_attrs %{description: nil, name: nil}

    test "list_todo/0 returns all todo" do
      todo = todo_fixture()
      assert Todos.list_todo() == [todo]
    end

    test "get_todo!/1 returns the todo with given id" do
      todo = todo_fixture()
      assert Todos.get_todo!(todo.id) == todo
    end

    test "create_todo/1 with valid data creates a todo" do
      valid_attrs = %{description: "some description", name: "some name"}

      assert {:ok, %Todo{} = todo} = CreateTodo.create_todo(valid_attrs)
      assert todo.description == "some description"
      assert todo.name == "some name"
    end

    test "create_todo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = CreateTodo.create_todo(@invalid_attrs)
    end

    test "update_todo/2 with valid data updates the todo" do
      todo = todo_fixture()
      update_attrs = %{description: "some updated description", name: "some updated name"}

      assert {:ok, %Todo{} = todo} = Todos.update_todo(todo, update_attrs)
      assert todo.description == "some updated description"
      assert todo.name == "some updated name"
    end

    test "update_todo/2 with invalid data returns error changeset" do
      todo = todo_fixture()
      assert {:error, %Ecto.Changeset{}} = Todos.update_todo(todo, @invalid_attrs)
      assert todo == Todos.get_todo!(todo.id)
    end

    test "delete_todo/1 deletes the todo" do
      todo = todo_fixture()
      assert {:ok, %Todo{}} = Todos.delete_todo(todo)
      assert_raise Ecto.NoResultsError, fn -> Todos.get_todo!(todo.id) end
    end

    test "change_todo/1 returns a todo changeset" do
      todo = todo_fixture()
      assert %Ecto.Changeset{} = Todos.change_todo(todo)
    end
  end
end
