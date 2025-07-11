defmodule BelanjaHarian.KewanganFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `BelanjaHarian.Kewangan` context.
  """

  @doc """
  Generate a perbelanjaan.
  """
  def perbelanjaan_fixture(attrs \\ %{}) do
    {:ok, perbelanjaan} =
      attrs
      |> Enum.into(%{
        jumlah: "120.5",
        kategori: "some kategori",
        tajuk: "some tajuk",
        tarikh: ~D[2025-07-02]
      })
      |> BelanjaHarian.Kewangan.create_perbelanjaan()

    perbelanjaan
  end
end
