json.ports @ports do |port|
  json.id port.id
  json.name port.name
  json.porttype_id port.porttype_id
  json.connecteddevice port.connecteddevice
end
