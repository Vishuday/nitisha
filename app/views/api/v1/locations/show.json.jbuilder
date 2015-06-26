json.location do
  json.id @location.id
  json.name @location.name
  json.parent_id @location.parent_id
  json.created_at @location.created_at
  json.updated_at @location.updated_at
end
