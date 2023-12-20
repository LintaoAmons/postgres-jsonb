```json
{
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
```

---

```sql
select * from "example_table";
```


```
 id |                                                                                                                                                        data                                                                                                                                                         
----+---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  1 | {"users": [{"age": 30, "name": {"last": "Doe", "first": "John"}, "addresses": [{"city": "New York", "type": "home"}, {"city": "Boston", "type": "work"}]}, {"age": 25, "name": {"last": "Smith", "first": "Jane"}, "addresses": [{"city": "Seattle", "type": "home"}, {"city": "San Francisco", "type": "work"}]}]}
(1 row)
```

---

```sql
SELECT id, jsonb_typeof(data -> 'users') from "example_table" 
WHERE jsonb_typeof(data -> 'users') = 'array';
```

```
 id | jsonb_typeof 
----+--------------
  1 | array
(1 row)

```

---

```sql
SELECT data->'users'->0->'name'->>'first' FROM example_table;
```

```
 ?column? 
----------
 John
(1 row)

```

---

`->>` 操作符用于从 JSON 对象中获取文本值（字符串）。
`->` 操作符用于从 JSON 对象中获取嵌套的 JSON 对象或数组。

```sql
SELECT data->'users'->0->'addresses', jsonb_typeof(data->'users'->0->'addresses') FROM example_table;
```

```
                                  ?column?                                  | jsonb_typeof 
----------------------------------------------------------------------------+--------------
 [{"city": "New York", "type": "home"}, {"city": "Boston", "type": "work"}] | array
(1 row)
```

```sql
SELECT data->'users'->0->>'addresses', jsonb_typeof(data->'users'->0->>'addresses') FROM example_table;
```

```
ERROR:  function jsonb_typeof(text) does not exist
LINE 1: SELECT data->'users'->0->>'addresses', jsonb_typeof(data->'u...
                                               ^
HINT:  No function matches the given name and argument types. You might need to add explicit type casts.
```

由于 `jsonb_typeof` 里面的结果是个字符串而不是json对象，所以报错

```
                                  ?column?                                  | jsonb_typeof 
----------------------------------------------------------------------------+--------------
 [{"city": "New York", "type": "home"}, {"city": "Boston", "type": "work"}] | array
(1 row)

```
