json.connection do
  json.id @connection.id
  json.cabletype_id @connection.cabletype_id
  json.cabletype @connection.cabletype
  json.porta_id @connection.porta_id
  json.porta @connection.porta
  json.portb_id @connection.portb_id
  json.portb @connection.portb
  json.inverse_id @connection.inverse_id
  json.inverse @connection.inverse
  json.created_at @connection.created_at
  json.updated_at @connection.updated_at
end
