defmodule WabanexWeb.Resolvers.User do
  def create(%{input: param}, __context), do: Wabanex.Users.Create.call(param)
  def get(%{id: user_id}, __context), do: Wabanex.Users.Get.call(user_id)
end
