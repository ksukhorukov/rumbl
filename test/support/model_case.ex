defmodule Rumbl.ModelCase do
  use ExUnit.CaseTemplate

  using do
    quote do
      alias Rumbl.Repo

      import Ecto
      import Ecto.Changeset
      import Ecto.Query, only: [from: 1, from: 2]
      import Rumbl.TestHelpers 
      import Rumbl.ModelCase
    end
  end

  setup tags do
    unless tags[:async] do
      Ecto.Adapters.SQL.restart_test_transaction(Rumbl.Repo, [])
    end

    :ok
  end

  def errors_on(model, data) do
    model.__struct__.changeset(model, data).errors
  end
end