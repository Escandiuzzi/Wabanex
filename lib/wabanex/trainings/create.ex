defmodule Wabanex.Training.Create do
  alias Wabanex.{Repo, Trainings}

  def call(params) do
    params
    |> Trainings.changeset()
    |> Repo.insert()
  end

end
