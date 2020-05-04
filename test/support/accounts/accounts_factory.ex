defmodule Kid.AccountsFactory do
  defmacro __using__(_opts) do
    quote do
      def user_factory do
        {:ok, current_utc_time} = DateTime.now("Etc/UTC")

        %Kid.Accounts.User{
          email: sequence(:email, &"email-#{&1}@example.com"),
          username: sequence(:username, &"some username-#{&1}"),
          hashed_password: sequence(:hashed_password, &"some hash #{&1}")
        }
      end

      def new_user_factory do
        %Kid.Accounts.User{
          email: sequence(:email, &"email-#{&1}@example.com"),
          username: sequence(:username, &"some username-#{&1}"),
          password: sequence(:password, &"some password #{&1}")
        }
      end
    end
  end
end
