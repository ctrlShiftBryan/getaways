defmodule GetawaysWeb.Resolvers.Vacation do
  alias Getaways.Vacation
  alias Getaways.Vacation.Place

  @places [
    %Place{
      id: 1,
      location: "2Portugal",
      name: "Sand Castle",
      max_guests: 3
    },
    %Place{
      id: 2,
      location: "Canada",
      name: "Blue Igloo",
      max_guests: 3
    },
    %Place{
      id: 3,
      location: "Switzerland",
      name: "Ski Cabin",
      max_guests: 3
    }
  ]
  @spec places(any, any, any) :: {:ok, [Getaways.Vacation.Place.t(), ...]}
  def places(_root, _args, _info) do
    {:ok, @places}
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

  @spec update_places(any, any, any) :: {:ok, [Getaways.Vacation.Place.t(), ...]}
  def update_places(_root, args, _info) do
    # todo here would use the args to return the do our thing
    IO.inspect(args)

    # finally return the result
    {:ok, @places}
  end

  @spec place(any, %{id: any}, any) :: {:ok, any}
  def place(_root, %{id: id}, _info) do
    {:ok, Vacation.get_place!(id)}
  end
end
