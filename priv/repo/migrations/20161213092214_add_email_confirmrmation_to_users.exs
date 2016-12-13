defmodule Joyvote.Repo.Migrations.AddEmailConfirmrmationToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :unconfirmed_email, :string
      add :email_confirmed_at, :datetime
    end
  end
end
