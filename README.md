# *[Rails TODO App - API](https://github.com/qasimabdullah404/todo_api/projects/1)*

*[Root URL](https://rl-todo-api.herokuapp.com/)* | *[URL to make requests](https://rl-todo-api.herokuapp.com/api/v1/todos)*

> Todo Model

``task - String || task_completed - boolean -> task_completed defaults to false``

API requests to ``/api/v1/todos`` [**GET ``/api/v1/todos`` for all todos**]

```
C - [POST] /api/v1/todos with json body containing task
R - [GET] /api/v1/todos/:id
U - [PUT/PATCH] /api/v1/todos/:id with json body containing task|task_completed
D - [DELETE] /api/v1/todos/:id with json body containing task
```

## Development
Ruby: `3.1.1` Rails: `7` `Postgresql` and `Redis`

1. Fork the repository
2. RUN `bundle install`
3. RUN `rails db:create db:migrate`
4. RUN `rails s`
5. RUN `redis-server`
6. Thanks for your contribution!

## API Requests limitations
Uses Redis with defaults set to 60 requests per 15 minutes. This can be changed *[here](https://github.com/qasimabdullah404/todo_api/blob/main/config/initializers/throttle.rb#L6-L7)*