defmodule BelanjaHarian.Kewangan do
  @moduledoc """
  The Kewangan context.
  """

  import Ecto.Query, warn: false
  alias BelanjaHarian.Repo

  alias BelanjaHarian.Kewangan.Perbelanjaan

  @doc """
  Returns the list of perbelanjaan.

  ## Examples

      iex> list_perbelanjaan()
      [%Perbelanjaan{}, ...]

  """
  def list_perbelanjaan do
    Repo.all(Perbelanjaan)
  end

  @doc """
  Gets a single perbelanjaan.

  Raises `Ecto.NoResultsError` if the Perbelanjaan does not exist.

  ## Examples

      iex> get_perbelanjaan!(123)
      %Perbelanjaan{}

      iex> get_perbelanjaan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_perbelanjaan!(id), do: Repo.get!(Perbelanjaan, id)

  @doc """
  Creates a perbelanjaan.

  ## Examples

      iex> create_perbelanjaan(%{field: value})
      {:ok, %Perbelanjaan{}}

      iex> create_perbelanjaan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_perbelanjaan(attrs \\ %{}) do
    %Perbelanjaan{}
    |> Perbelanjaan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a perbelanjaan.

  ## Examples

      iex> update_perbelanjaan(perbelanjaan, %{field: new_value})
      {:ok, %Perbelanjaan{}}

      iex> update_perbelanjaan(perbelanjaan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_perbelanjaan(%Perbelanjaan{} = perbelanjaan, attrs) do
    perbelanjaan
    |> Perbelanjaan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a perbelanjaan.

  ## Examples

      iex> delete_perbelanjaan(perbelanjaan)
      {:ok, %Perbelanjaan{}}

      iex> delete_perbelanjaan(perbelanjaan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_perbelanjaan(%Perbelanjaan{} = perbelanjaan) do
    Repo.delete(perbelanjaan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking perbelanjaan changes.

  ## Examples

      iex> change_perbelanjaan(perbelanjaan)
      %Ecto.Changeset{data: %Perbelanjaan{}}

  """
  def change_perbelanjaan(%Perbelanjaan{} = perbelanjaan, attrs \\ %{}) do
    Perbelanjaan.changeset(perbelanjaan, attrs)
  end
end
