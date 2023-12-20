CREATE TABLE example_table (
    id SERIAL PRIMARY KEY,
    data JSONB
);

INSERT INTO example_table (data) VALUES ('{
  "users": [
    {
      "name": {
        "first": "John",
        "last": "Doe"
      },
      "age": 30,
      "addresses": [
        {"type": "home", "city": "New York"},
        {"type": "work", "city": "Boston"}
      ]
    },
    {
      "name": {
        "first": "Jane",
        "last": "Smith"
      },
      "age": 25,
      "addresses": [
        {"type": "home", "city": "Seattle"},
        {"type": "work", "city": "San Francisco"}
      ]
    }
  ]
}
');
