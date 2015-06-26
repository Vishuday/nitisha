json.interface do
  json.id @interface.id
  json.name @interface.name
  json.port_id @interface.port_id
  json.port @interface.port
  json.ipaddresses @interface.ipaddresses
  json.created_at @interface.created_at
  json.updated_at @interface.updated_at
end
