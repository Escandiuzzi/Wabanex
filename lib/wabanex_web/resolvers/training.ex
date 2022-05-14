defmodule WabanexWeb.Resolvers.Training do
  def create(%{input: param}, __context), do: WabanexWeb.Trainings.Create.call(param)
end
