defmodule TodoListPhoenixWeb.TodoController do
  use TodoListPhoenixWeb, :controller

  alias TodoListPhoenix.Todos
  alias TodoListPhoenix.Todos.Domain.Todo
  alias TodoListPhoenix.Todos.Actions

  action_fallback TodoListPhoenixWeb.FallbackController

  def index(conn, _params) do
    todos = Actions.ListTodos.execute()
    render(conn, "index.json", todos: todos)
  end

  def create(conn, %{"todo" => todo_params}) do
    with {:ok, %Todo{} = todo} <- Actions.CreateTodo.execute(todo_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.todo_path(conn, :show, todo))
      |> render("show.json", todo: todo)
    end
  end

  def show(conn, %{"id" => id}) do
    todo = Todos.get_todo!(id)
    render(conn, "show.json", todo: todo)
  end

  def update(conn, %{"id" => id, "todo" => todo_params}) do
    todo = Todos.get_todo!(id)

    with {:ok, %Todo{} = todo} <- Todos.update_todo(todo, todo_params) do
      render(conn, "show.json", todo: todo)
    end
  end

  def delete(conn, %{"id" => id}) do
    todo = Todos.get_todo!(id)

    with {:ok, %Todo{}} <- Todos.delete_todo(todo) do
      send_resp(conn, :no_content, "")
    end
  end
end
