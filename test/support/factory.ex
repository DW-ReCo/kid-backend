defmodule Kid.Factory do
  use ExMachina.Ecto, repo: Kid.Repo
  use Kid.AccountsFactory
end
