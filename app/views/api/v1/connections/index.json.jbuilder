json.connections @connections do |connection|
  json.id connection.id
  json.cabletype_id connection.cabletype_id
  json.porta_id connection.porta_id
  json.portb_id connection.portb_id
  json.inverse_id connection.inverse_id
end
