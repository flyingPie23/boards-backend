json.array! @boards do |board|
  json.extract! board, :id, :name, :banner_url, :created_at
end
