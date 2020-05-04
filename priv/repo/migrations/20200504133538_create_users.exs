defmodule Kid.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :email, :string
      add :hashed_password, :string
      add :password, :string
      add :username, :string

      timestamps()
    end

  end
end
