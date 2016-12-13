defmodule Joyvote.SessionController do
  use Joyvote.Web, :controller
  plug Guardian.Plug.EnsureAuthenticated,
    %{
      on_failure: { Joyvote.SessionController, :new }
    } when action == :delete

  alias Joyvote.Session

  def new(conn, _params) do
    changeset = User.changeset(%User{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"user" => user_params}) do
    changeset = User.create_changeset(%User{}, user_params)

    if changeset.valid? do
      user = Repo.insert(changeset)

      conn
      |> put_flash(:info, "User created successfully.")
      |> Guardian.Plug.sign_in(user, :token)
      |> redirect(to: user_path(conn, :index))
    else
      render(conn, "new.html", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    session = Repo.get!(User, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(session)

    conn
    |> put_flash(:info, "Session deleted successfully.")
    |> redirect(to: session_path(conn, :index))
  end
end
