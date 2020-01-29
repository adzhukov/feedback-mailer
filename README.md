## API

- **POST** */upload*
  > Returns unique file identifier used in /mail and /slack.
  - Method: `POST`
  - Content-Type: `multipart/form-data;`
  - Field: `file`
  - Response:
    - `200 OK`, `{"response": "0c643948-42df-11ea-9c9c-0242ac110002"}`, if successful.
    - `400 BAD REQUEST`, `{"error": "No file received"}`, if request does not conatins *file* field.
    - `422 UNPROCESSABLE ENTITY`, `{"error": "Unprocessable file received"}`, if *file* is not file.
    - `413 REQUEST ENTITY TOO LARGE`, if file size exceeded.
  - Example: `curl -F "file=@log.txt" localhost:8080/upload`


- **POST** */mail*
  > Sends email.
  - Method: `POST`
  - Content-Type: `application/json;` 
  - Fields:
    - `subject` – string, optional.
    - `text` – string, optional.
    - `files` – [string], optional unless *subject* and *text* undefined.
  - Return:
    - `200 OK`, `{"response": "MAIL SERVER RESPONSE"}` if successful.
    - `400 BAD REQUEST`, `{"code": 0, "message": "message"}` or `{"message": "message"}` otherwise.
  - Example: `curl -X "POST" "http://localhost:8080/mail" -H 'Content-Type: application/json; charset=utf-8' -d $'{"subject": "Example subject", "files": ["0c643948-42df-11ea-9c9c-0242ac110002", "2c3948-42ff-11ea-9c9c-0242ff18123"], "text": "Example text"}'`


- **POST** /slack
  > Sends message to Slack channel.
  - Method: `POST`
  - Content-Type: `application/json;`
  - Fields:
    - `subject` – string, optional.
    - `text` – string, optional.
    - `files` – [string], optional unless *subject* and *text* undefined.
  - Return:
    - `OK 200`, `{"response": "MAIL SERVER RESPONSE"}` if successful.
    - `BAD REQUEST 400`, `{"code": 0, "message": "message"}` or `{"message": "message"}` otherwise.  
  - Example: `curl -X "POST" "http://localhost:8080/slack" -H 'Content-Type: application/json; charset=utf-8' -d $'{"subject": "Example subject", "files": ["0c643948-42df-11ea-9c9c-0242ac110002", "2c3948-42ff-11ea-9c9c-0242ff18123"], "text": "Example text"}'`
 
## Usage

Create *config.env* file (example given), then `make up`.

