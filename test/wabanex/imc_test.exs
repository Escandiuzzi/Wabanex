defmodule Wabanex.IMCTest do
  use ExUnit.Case, async: true

  alias Wabanex.IMC

  describe "calculate/1" do
    test "when the file exists, return the data" do
      params = %{"filename" => "students.csv"}

      response = IMC.calculate(params)

      expected_response =
      {
        :ok,
        %{
          "Arthur" => 26.86873565994445,
          "Breno" => 20.902385858042937,
          "Lorenzo" => 22.34351559258195,
          "Luiz" => 27.77427092538821,
          "Luquinhas" => 28.59675712774171
        }
      }

      assert response == expected_response
    end

    test "when the wrong filename is given, return an error" do
      params = %{"filename" => "error.csv"}

      response = IMC.calculate(params)

      expected_response = {:error, "Error while opening the file"}

      assert response == expected_response
    end
  end
end
