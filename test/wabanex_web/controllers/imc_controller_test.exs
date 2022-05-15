defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all param are valid, returns IMC info", %{conn: conn} do
      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)

        expected_result = %{"result" => %{"Arthur" => 26.86873565994445, "Breno" => 20.902385858042937, "Lorenzo" => 22.34351559258195, "Luiz" => 27.77427092538821, "Luquinhas" => 28.59675712774171}}

      assert response == expected_result
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{"filename" => "test.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

        expected_result = %{"result" => "Error while opening the file"}

      assert response == expected_result
    end
  end
end
