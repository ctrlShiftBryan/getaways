defmodule GetawaysWeb.Resolvers.Vacation do
  alias Getaways.Vacation

  def places(x, y, z) do
    places = [
      %Getaways.Vacation.Place{
        id: 1,
        location: "2Portugal",
        name: "Sand Castle"
      },
      %Getaways.Vacation.Place{
        id: 2,
        location: "Canada",
        name: "Blue Igloo"
      },
      %Getaways.Vacation.Place{
        id: 3,
        location: "Switzerland",
        name: "Ski Cabin"
      }
    ]

    # {:ok, Vacation.list_places()}
    {:ok, places}
  end

  def place(_, %{id: id}, _) do
    {:ok, Vacation.get_place!(id)}
  end
end
