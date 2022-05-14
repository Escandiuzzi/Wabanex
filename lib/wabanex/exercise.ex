defmodule Wabanex.Exercise do
  use Ecto.Schema
  import Ecto.Changeset

  alias Wabanex.Trainings

  @primary_key { :id, :binary_id, autogenerate: true }
  @fields [ :name, :protocol_description, :repetitions, :youtube_video_url ]

  schema "exercises" do
    field :name, :string
    field :protocol_description, :string
    field :repetitions, :string
    field :youtube_video_url, :string

    belongs_to :training, Trainings

    timestamps()
  end

  def changeset(exercise, params) do
      exercise
      |> cast(params, @fields)
      |> validate_required(@fields)
  end
end
