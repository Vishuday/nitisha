json.iprange do
  json.id @iprange.id
  json.name @iprange.name
  json.address @iprange.address
  json.prefix @iprange.prefix
  json.parent_id @iprange.parent_id
  json.parent @iprange.parent
  json.created_at @iprange.created_at
  json.updated_at @iprange.updated_at
end
