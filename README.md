https://quiet-sea-21736.herokuapp.com/

#### Authentication

**Create User:**

`POST /api/v1/user_create {"nickname": "foo","email": "foo@bar.com", "password": "secret", "password_confirmation: "secret"}`

**Get token:**

`POST /user_token
 {"auth": {"email": "foo@bar.com", "password": "secret"}}`

**Example response from the API:**

`201 Created
 {"jwt": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9"}`
 
**To make an authenticated request to your API, you need to pass the token via the request header:**
 
`Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9
 GET /my_resources`
  
