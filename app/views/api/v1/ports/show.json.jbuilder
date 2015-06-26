json.port do
  json.id @port.id
  json.name @port.name
  json.porttype @port.porttype
  json.connecteddevice @port.connecteddevice
end
