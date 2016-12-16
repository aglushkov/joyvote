defmodule Joyvote.SessionControllerTest do
  use Joyvote.ConnCase

  alias Joyvote.User
  @valid_attrs %{unconfirmed_email: "@", password: '1234', password_confirmation: '1234'}
  @invalid_attrs %{}

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, session_path(conn, :new)
    assert html_response(conn, 200) =~ "New session"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: @valid_attrs
    assert redirected_to(conn) == "/"
    assert Repo.get_by(User, %{unconfirmed_email: "@"})
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, session_path(conn, :create), user: @invalid_attrs
    assert html_response(conn, 200) =~ "New session"
  end

  test "redirects user to home page when deleting session", %{conn: conn} do
    conn = get conn, session_path(conn, :delete, session)
    assert redirected_to(conn) == "/"
  end
end
