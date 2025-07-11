defmodule BelanjaHarianWeb.PerbelanjaanLive.Index do
  use BelanjaHarianWeb, :live_view

  alias BelanjaHarian.Kewangan
  alias BelanjaHarian.Kewangan.Perbelanjaan

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :perbelanjaan_collection, Kewangan.list_perbelanjaan())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Perbelanjaan")
    |> assign(:perbelanjaan, Kewangan.get_perbelanjaan!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Perbelanjaan")
    |> assign(:perbelanjaan, %Perbelanjaan{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Perbelanjaan")
    |> assign(:perbelanjaan, nil)
  end

  @impl true
  def handle_info({BelanjaHarianWeb.PerbelanjaanLive.FormComponent, {:saved, perbelanjaan}}, socket) do
    {:noreply, stream_insert(socket, :perbelanjaan_collection, perbelanjaan)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    perbelanjaan = Kewangan.get_perbelanjaan!(id)
    {:ok, _} = Kewangan.delete_perbelanjaan(perbelanjaan)

    {:noreply, stream_delete(socket, :perbelanjaan_collection, perbelanjaan)}
  end
end
