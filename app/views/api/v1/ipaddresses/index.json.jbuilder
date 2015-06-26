json.ipaddresses @ipaddresses do |ipaddress|
  json.id ipaddress.id
  json.address ipaddress.address
  json.parent_id ipaddress.parent_id
  json.interface_id ipaddress.interface_id
end
