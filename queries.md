```
query {
  place(id: 2) {
    id
    name
    location
    maxGuests
  }
}
```

```
query {
  places {
    id
    name
    location
  }
}
```

```
mutation {
  createPlace(
    name: "cmm",
    location: "ohio",
    maxGuests: 4
  ) {
    id
    name
    location
    maxGuests
  }
}
```

```
mutation {
  update_places(places: [{id: 3, name: "CBUS"}]) {
    id
    name
    location
    maxGuests
  }
}
```
