Plan:
  - Add users
  - Add authorization pages (prefer existing library)
  - Add votings (user has many votings)
  - Add page to create votings
  - Add voters (users has many voters and votings has many voters)
  - Add page to add available voters to voting
  - Add start voting button - sent emails to voters in background
  - Add page to vote
  - Add websocket channel for discussing
  - Add existing CMS



1) mix phoenix.gen.html User users name:string email:string:unique encrypted_password:string
