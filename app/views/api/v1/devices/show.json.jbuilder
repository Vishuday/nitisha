json.device do
  json.id @device.id
  json.name @device.name
  json.description @device.description
  json.devicetype @device.devicetype
  json.asset @device.asset
  json.location @device.location
  json.created_at @device.created_at
  json.updated_at @device.updated_at
end
