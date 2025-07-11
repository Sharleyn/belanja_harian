defmodule BelanjaHarianWeb.PerbelanjaanLiveTest do
  use BelanjaHarianWeb.ConnCase

  import Phoenix.LiveViewTest
  import BelanjaHarian.KewanganFixtures

  @create_attrs %{tajuk: "some tajuk", kategori: "some kategori", jumlah: "120.5", tarikh: "2025-07-02"}
  @update_attrs %{tajuk: "some updated tajuk", kategori: "some updated kategori", jumlah: "456.7", tarikh: "2025-07-03"}
  @invalid_attrs %{tajuk: nil, kategori: nil, jumlah: nil, tarikh: nil}

  defp create_perbelanjaan(_) do
    perbelanjaan = perbelanjaan_fixture()
    %{perbelanjaan: perbelanjaan}
  end

  describe "Index" do
    setup [:create_perbelanjaan]

    test "lists all perbelanjaan", %{conn: conn, perbelanjaan: perbelanjaan} do
      {:ok, _index_live, html} = live(conn, ~p"/perbelanjaan")

      assert html =~ "Listing Perbelanjaan"
      assert html =~ perbelanjaan.tajuk
    end

    test "saves new perbelanjaan", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/perbelanjaan")

      assert index_live |> element("a", "New Perbelanjaan") |> render_click() =~
               "New Perbelanjaan"

      assert_patch(index_live, ~p"/perbelanjaan/new")

      assert index_live
             |> form("#perbelanjaan-form", perbelanjaan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#perbelanjaan-form", perbelanjaan: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/perbelanjaan")

      html = render(index_live)
      assert html =~ "Perbelanjaan created successfully"
      assert html =~ "some tajuk"
    end

    test "updates perbelanjaan in listing", %{conn: conn, perbelanjaan: perbelanjaan} do
      {:ok, index_live, _html} = live(conn, ~p"/perbelanjaan")

      assert index_live |> element("#perbelanjaan-#{perbelanjaan.id} a", "Edit") |> render_click() =~
               "Edit Perbelanjaan"

      assert_patch(index_live, ~p"/perbelanjaan/#{perbelanjaan}/edit")

      assert index_live
             |> form("#perbelanjaan-form", perbelanjaan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#perbelanjaan-form", perbelanjaan: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/perbelanjaan")

      html = render(index_live)
      assert html =~ "Perbelanjaan updated successfully"
      assert html =~ "some updated tajuk"
    end

    test "deletes perbelanjaan in listing", %{conn: conn, perbelanjaan: perbelanjaan} do
      {:ok, index_live, _html} = live(conn, ~p"/perbelanjaan")

      assert index_live |> element("#perbelanjaan-#{perbelanjaan.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#perbelanjaan-#{perbelanjaan.id}")
    end
  end

  describe "Show" do
    setup [:create_perbelanjaan]

    test "displays perbelanjaan", %{conn: conn, perbelanjaan: perbelanjaan} do
      {:ok, _show_live, html} = live(conn, ~p"/perbelanjaan/#{perbelanjaan}")

      assert html =~ "Show Perbelanjaan"
      assert html =~ perbelanjaan.tajuk
    end

    test "updates perbelanjaan within modal", %{conn: conn, perbelanjaan: perbelanjaan} do
      {:ok, show_live, _html} = live(conn, ~p"/perbelanjaan/#{perbelanjaan}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Perbelanjaan"

      assert_patch(show_live, ~p"/perbelanjaan/#{perbelanjaan}/show/edit")

      assert show_live
             |> form("#perbelanjaan-form", perbelanjaan: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#perbelanjaan-form", perbelanjaan: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/perbelanjaan/#{perbelanjaan}")

      html = render(show_live)
      assert html =~ "Perbelanjaan updated successfully"
      assert html =~ "some updated tajuk"
    end
  end
end
