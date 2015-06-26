json.devices @devices do |device|
  json.id device.id
  json.name device.name
  json.description device.description
  json.devicetype device.devicetype
  json.asset device.asset
  json.location device.location
end
