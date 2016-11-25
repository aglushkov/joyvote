defmodule Joyvote.UserTest do
  use Joyvote.ModelCase

  alias Joyvote.User

  @valid_attrs %{email: "some content", password: "some content", password_confirmation: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = User.changeset(%User{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = User.changeset(%User{}, @invalid_attrs)
    refute changeset.valid?
  end
end
