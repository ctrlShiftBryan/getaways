defmodule GetawaysWeb.Resolvers.Vacation do
  alias Getaways.Vacation
  alias Getaways.Vacation.Place

  @spec places(any, any, any) :: {:ok, [Getaways.Vacation.Place.t(), ...]}
  def places(_root, _args, _info) do
    places = [
      %Place{
        id: 1,
        location: "2Portugal",
        name: "Sand Castle"
      },
      %Place{
        id: 2,
        location: "Canada",
        name: "Blue Igloo"
      },
      %Place{
        id: 3,
        location: "Switzerland",
        name: "Ski Cabin"
      }
    ]

    # {:ok, Vacation.list_places()}
    {:ok, places}
  end

  @spec create_place(
          any,
          :invalid | %{optional(:__struct__) => none, optional(atom | binary) => any},
          any
        ) :: {:error, <<_::168>>} | {:ok, any}
  def create_place(_root, args, _info) do
    case Getaways.Vacation.create_place(args) do
      {:ok, place} ->
        {:ok, place}

      _error ->
        {:error, "could not create link"}
    end
  end

  @spec place(any, %{id: any}, any) :: {:ok, any}
  def place(_root, %{id: id}, _info) do
    {:ok, Vacation.get_place!(id)}
  end
end
