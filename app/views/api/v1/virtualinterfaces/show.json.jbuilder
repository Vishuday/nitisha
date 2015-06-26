json.virtualinterface do
  json.id @virtualinterface.id
  json.name @virtualinterface.name
  json.ipaddresses @virtualinterface.ipaddresses
  json.created_at @virtualinterface.created_at
  json.updated_at @virtualinterface.updated_at
end
