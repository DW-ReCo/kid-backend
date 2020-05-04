defmodule Kid.Accounts.User do
  @moduledoc false

  use Kid.Model

  alias Argon2

  schema "users" do
    field :email, :string
    field :hashed_password, :string
    field :password, :string, virtual: true
    field :username, :string

    timestamps()
  end

  @allowed_fields ~w(email hashed_password password username)a
  @required_fields ~w(email username)a
  @email_regex ~r/^[\w.!#$%&’*+\-\/=?\^`{|}~]+@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)*$/i

  @doc false
  def changeset(user, attrs \\ %{}) do
    attrs_clean =
      attrs
      |> filter_empty_password()

    user
    |> cast(attrs_clean, @allowed_fields)
    |> validate_required(@required_fields)
    |> validate_format(:email, @email_regex)
    |> unique_constraint(:email)
    |> put_password_hash()
  end

  defp put_password_hash(
         %Ecto.Changeset{valid?: true, changes: %{password: password}} = changeset
       ) do
    change(changeset, hashed_password: Argon2.hash_pwd_salt(password))
  end

  defp put_password_hash(changeset), do: changeset

  defp filter_empty_password(%{"password" => pw} = params) do
    if is_nil(pw) or pw == "" do
      Map.drop(params, ["password"])
    else
      params
    end
  end

  defp filter_empty_password(params), do: params
end
