defmodule BelanjaHarian.Repo.Migrations.CreatePerbelanjaan do
  use Ecto.Migration

  def change do
    create table(:perbelanjaan) do
      add :tajuk, :string
      add :kategori, :string
      add :jumlah, :decimal
      add :tarikh, :date

      timestamps(type: :utc_datetime)
    end
  end
end
