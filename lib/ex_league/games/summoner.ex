defmodule ExLeague.Games.Summoner do
  use Ecto.Schema
  import Ecto.Changeset

  alias ExLeague.Games.Pro

  schema "summoners" do
    field :name, :string

    field :platform_id, Ecto.Enum,
      values: [:br1, :eun1, :euw1, :jp1, :kr, :la1, :la2, :na1, :oc1, :ru, :tr1]

    field :puuid, :string

    belongs_to :pro, Pro

    timestamps()
  end

  @doc false
  def changeset(summoner, attrs) do
    summoner
    |> cast(attrs, [:name, :puuid, :platform_id, :pro_id])
    |> validate_required([:name, :puuid, :platform_id])
    |> unique_constraint([:puuid, :platform_id], name: "summoners_puuid_platform_id_index")
    |> foreign_key_constraint(:pro_id)
  end
end
