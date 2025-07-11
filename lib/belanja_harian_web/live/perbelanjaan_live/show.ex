defmodule BelanjaHarianWeb.PerbelanjaanLive.Show do
  use BelanjaHarianWeb, :live_view

  alias BelanjaHarian.Kewangan

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:perbelanjaan, Kewangan.get_perbelanjaan!(id))}
  end

  defp page_title(:show), do: "Show Perbelanjaan"
  defp page_title(:edit), do: "Edit Perbelanjaan"
  defp page_title(:bmi_calculator), do: "BMI Calculator"
end
