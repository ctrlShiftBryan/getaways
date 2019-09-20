defmodule GetawaysWeb.Schema.Schema do
  use Absinthe.Schema

  query do
    @desc "Get a list of places"
    field :places, non_null(list_of(non_null(:place))) do
      resolve(&GetawaysWeb.Resolvers.Vacation.places/3)
    end

    @desc "Get a place by its id"
    field :place, :place do
      arg(:id, non_null(:id))
      resolve(&GetawaysWeb.Resolvers.Vacation.place/3)
    end
  end

  mutation do
    field :update_places, list_of(:place) do
      arg(:places, list_of(non_null(:place_update)))
      # arg(:location, non_null(:string))
      # arg(:max_guests, non_null(:integer))

      resolve(&GetawaysWeb.Resolvers.Vacation.update_places/3)
    end

    field :create_place, :place do
      arg(:name, non_null(:string))
      arg(:location, non_null(:string))
      arg(:max_guests, non_null(:integer))

      resolve(&GetawaysWeb.Resolvers.Vacation.create_place/3)
    end
  end

  input_object :place_update do
    field :id, non_null(:id)
    field :name, non_null(:string)
  end

  object :place do
    field :id, non_null(:id)
    field :name, non_null(:string)
    field :location, non_null(:string)
    field :max_guests, non_null(:integer)
  end
end
