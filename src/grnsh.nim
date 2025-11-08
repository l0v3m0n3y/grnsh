import asyncdispatch, httpclient, json

const api = "https://api.grnsh.app/api/v1"
var headers = newHttpHeaders({
  "Connection": "keep-alive", 
  "Host": "api.grnsh.app",
  "Content-Type": "application/json", 
  "accept": "application/json", 
  "user-agent": "okhttp/4.12.0"
})

proc get_ingredients*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/ingredients")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_ingredients_by_id*(id:int): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/ingredients/" & $id)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc cocktails_with_ingredients*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/cocktails/withIngredients")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_cocktails_by_id*(id:int=1): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/cocktails/" & $id)
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()

proc get_cocktails*(): Future[JsonNode] {.async.} =
  let client = newAsyncHttpClient()
  client.headers = headers
  try:
    let response = await client.get(api & "/cocktails")
    let body = await response.body
    result = parseJson(body)
  finally:
    client.close()
