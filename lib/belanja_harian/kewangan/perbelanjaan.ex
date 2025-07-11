defmodule BelanjaHarian.Kewangan.Perbelanjaan do
  use Ecto.Schema
  import Ecto.Changeset

  schema "perbelanjaan" do
    field :tajuk, :string
    field :kategori, :string
    field :jumlah, :decimal
    field :tarikh, :date

    timestamps(type: :utc_datetime)
  end

  @doc false
  def changeset(perbelanjaan, attrs) do
    perbelanjaan
    |> cast(attrs, [:tajuk, :kategori, :jumlah, :tarikh])
    |> validate_required([:tajuk, :kategori, :jumlah, :tarikh])
  end
end
