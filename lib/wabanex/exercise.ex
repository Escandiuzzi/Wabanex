defmodule Wabanex.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.{Exercise, User}

  @primary_key { :id, :binary_id, autogenerate: true }
  @fields []

  schema "trainings" do
    field :start_date, :date
    field :end_data, :date

    belongs_to :user, User
    has_many :exervices, Exercise

    timestamps()
  end

  def changeset(params) do
      %__MODULE__{}
      |> cast(params, @fields)
      |> validate_required(@fields)
      |> validate_length(:password, min: 6)
      |> validate_length(:name, min: 2)
      |> validate_format(:email, ~r/@/)
      |> unique_constraint([:email])
  end
end
