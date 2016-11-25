defmodule Joyvote.User do
  use Joyvote.Web, :model

  schema "users" do
    field :name, :string
    field :email, :string
    field :encrypted_password, :string
    field :password, :string, virtual: true
    field :password_confirmation, :string, virtual: true

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """

  def changeset(struct, params \\ %{}) do
    required_params = [:name, :email, :password, :password_confirmation]
    struct
    |> cast(params, required_params)
    |> validate_required(required_params)
    |> update_change(:email, &String.downcase/1)
    |> unique_constraint(:email)
    |> validate_confirmation(:password, :password_confirmation)
  end

  def validate_password_confirmed(changeset) do
    password = changeset.password
    password_confirmation = changeset.password_confirmation

    if password == password_confirmation do
      changeset
    else
      add_error(changeset, :password_confirmation, "does not match")
    end
  end
end
