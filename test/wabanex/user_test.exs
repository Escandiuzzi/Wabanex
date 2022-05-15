defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{
        name: "Luiz Felipe Escandiuzzi",
        email: "escandiuzzi@test.com",
        password: "123456"
      }

      response = User.changeset(params)

      expected_response = %{
        name: "Luiz Felipe Escandiuzzi",
        email: "escandiuzzi@test.com",
        password: "123456"
      }

      assert %Ecto.Changeset{valid?: true, changes: expected_response, errors: []} = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{
        name: "L",
        email: "escandiuzzi@test.com"
      }

      response = User.changeset(params)

      expected_response = %{name: ["should be at least 2 character(s)"], password: ["can't be blank"]}


      assert errors_on(response) == expected_response
    end
  end
end
