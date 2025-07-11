defmodule BelanjaHarian.KewanganTest do
  use BelanjaHarian.DataCase

  alias BelanjaHarian.Kewangan

  describe "perbelanjaan" do
    alias BelanjaHarian.Kewangan.Perbelanjaan

    import BelanjaHarian.KewanganFixtures

    @invalid_attrs %{tajuk: nil, kategori: nil, jumlah: nil, tarikh: nil}

    test "list_perbelanjaan/0 returns all perbelanjaan" do
      perbelanjaan = perbelanjaan_fixture()
      assert Kewangan.list_perbelanjaan() == [perbelanjaan]
    end

    test "get_perbelanjaan!/1 returns the perbelanjaan with given id" do
      perbelanjaan = perbelanjaan_fixture()
      assert Kewangan.get_perbelanjaan!(perbelanjaan.id) == perbelanjaan
    end

    test "create_perbelanjaan/1 with valid data creates a perbelanjaan" do
      valid_attrs = %{tajuk: "some tajuk", kategori: "some kategori", jumlah: "120.5", tarikh: ~D[2025-07-02]}

      assert {:ok, %Perbelanjaan{} = perbelanjaan} = Kewangan.create_perbelanjaan(valid_attrs)
      assert perbelanjaan.tajuk == "some tajuk"
      assert perbelanjaan.kategori == "some kategori"
      assert perbelanjaan.jumlah == Decimal.new("120.5")
      assert perbelanjaan.tarikh == ~D[2025-07-02]
    end

    test "create_perbelanjaan/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Kewangan.create_perbelanjaan(@invalid_attrs)
    end

    test "update_perbelanjaan/2 with valid data updates the perbelanjaan" do
      perbelanjaan = perbelanjaan_fixture()
      update_attrs = %{tajuk: "some updated tajuk", kategori: "some updated kategori", jumlah: "456.7", tarikh: ~D[2025-07-03]}

      assert {:ok, %Perbelanjaan{} = perbelanjaan} = Kewangan.update_perbelanjaan(perbelanjaan, update_attrs)
      assert perbelanjaan.tajuk == "some updated tajuk"
      assert perbelanjaan.kategori == "some updated kategori"
      assert perbelanjaan.jumlah == Decimal.new("456.7")
      assert perbelanjaan.tarikh == ~D[2025-07-03]
    end

    test "update_perbelanjaan/2 with invalid data returns error changeset" do
      perbelanjaan = perbelanjaan_fixture()
      assert {:error, %Ecto.Changeset{}} = Kewangan.update_perbelanjaan(perbelanjaan, @invalid_attrs)
      assert perbelanjaan == Kewangan.get_perbelanjaan!(perbelanjaan.id)
    end

    test "delete_perbelanjaan/1 deletes the perbelanjaan" do
      perbelanjaan = perbelanjaan_fixture()
      assert {:ok, %Perbelanjaan{}} = Kewangan.delete_perbelanjaan(perbelanjaan)
      assert_raise Ecto.NoResultsError, fn -> Kewangan.get_perbelanjaan!(perbelanjaan.id) end
    end

    test "change_perbelanjaan/1 returns a perbelanjaan changeset" do
      perbelanjaan = perbelanjaan_fixture()
      assert %Ecto.Changeset{} = Kewangan.change_perbelanjaan(perbelanjaan)
    end
  end
end
