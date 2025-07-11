defmodule BelanjaHarianWeb.PerbelanjaanLive.FormComponent do
  use BelanjaHarianWeb, :live_component

  alias BelanjaHarian.Kewangan

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        {@title}
        <:subtitle>Use this form to manage perbelanjaan records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="perbelanjaan-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:tajuk]} type="text" label="Tajuk" />
        <.input field={@form[:kategori]} type="text" label="Kategori" />
        <.input field={@form[:jumlah]} type="number" label="Jumlah" step="any" />
        <.input field={@form[:tarikh]} type="date" label="Tarikh" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Perbelanjaan</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{perbelanjaan: perbelanjaan} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Kewangan.change_perbelanjaan(perbelanjaan))
     end)}
  end

  @impl true
  def handle_event("validate", %{"perbelanjaan" => perbelanjaan_params}, socket) do
    changeset = Kewangan.change_perbelanjaan(socket.assigns.perbelanjaan, perbelanjaan_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"perbelanjaan" => perbelanjaan_params}, socket) do
    save_perbelanjaan(socket, socket.assigns.action, perbelanjaan_params)
  end

  defp save_perbelanjaan(socket, :edit, perbelanjaan_params) do
    case Kewangan.update_perbelanjaan(socket.assigns.perbelanjaan, perbelanjaan_params) do
      {:ok, perbelanjaan} ->
        notify_parent({:saved, perbelanjaan})

        {:noreply,
         socket
         |> put_flash(:info, "Perbelanjaan updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_perbelanjaan(socket, :new, perbelanjaan_params) do
    case Kewangan.create_perbelanjaan(perbelanjaan_params) do
      {:ok, perbelanjaan} ->
        notify_parent({:saved, perbelanjaan})

        {:noreply,
         socket
         |> put_flash(:info, "Perbelanjaan created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
