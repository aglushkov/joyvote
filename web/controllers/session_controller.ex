defmodule Joyvote.SessionController do
  use Joyvote.Web, :controller
  plug Guardian.Plug.EnsureAuthenticated,
    %{
      on_failure: { Joyvote.SessionController, :new }
    } when action == :delete

  alias Joyvote.Session

  def new(conn, _params) do
    changeset = User.changeset
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

  def delete(conn) do
    Guardian.Plug.sign_out(conn)
      |> put_flash(:info, "Logged out successfully.")
      |> redirect(to: "/")
  end
end
