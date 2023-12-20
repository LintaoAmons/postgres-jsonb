## Learn by doing

1. 准备数据库和数据
```
❯ make prepare-db     
```

2. 参考 `./query_history.md` 自己跑着看看


## Learn PostgreSQL json by compare with JSONPath

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

### 1. 访问简单字段

**PostgreSQL:**

```sql
SELECT json_data->'users'->0->'name'->>'first' FROM example_table;
```

**JSONPath:**

```json
$.users[0].name.first
```

*两种表达式都用于获取第一个用户的名字。*

### 2. 访问数组元素

**PostgreSQL:**

```sql
SELECT json_data->'users'->0->'addresses'->1->>'city' FROM example_table;
```

**JSONPath:**

```json
$.users[0].addresses[1].city
```

*两种表达式都用于获取第一个用户的第二个地址的城市。*

### 3. 查找具有特定属性值的元素

**PostgreSQL:**

PostgreSQL不直接支持这种查询。需要使用SQL和JSON函数的组合，或在应用层处理。

**JSONPath:**

```json
$.users[?(@.age > 25)]
```

*此JSONPath表达式用于找到所有年龄超过25岁的用户。*

### 4. 深度嵌套查询

**PostgreSQL:**

```sql
SELECT json_data#>'{users, 0, addresses, 0, city}' FROM example_table;
```

**JSONPath:**

```json
$.users[0].addresses[0].city
```

*两种表达式都用于获取第一个用户的第一个地址的城市。*

### 总结
- PostgreSQL的JSON运算符更为严格，最适合直接的、结构化的查询。在数组对象中基于条件进行复杂搜索并不直接。
- JSONPath提供了更大的灵活性，能够轻松执行复杂查询，如过滤和通配符搜索。但是，JSONPath在PostgreSQL中并不是原生支持的。

总的来说，PostgreSQL的JSON查询功能在结构化的直接访问方面很强大，但缺乏JSONPath语言在查询和过滤JSON数据方面的灵活性。


