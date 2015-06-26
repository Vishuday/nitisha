json.ipaddress do
  json.id @ipaddress.id
  json.address @ipaddress.address
  json.parent_id @ipaddress.parent_id
  json.parent @ipaddress.parent
  json.interface_id @ipaddress.interface_id
  json.interface @ipaddress.interface
  json.created_at @ipaddress.created_at
  json.updated_at @ipaddress.updated_at
end
