json.array! @boards do |board|
  json.extract! board, :id, :name, :bio, :banner_url ,:created_at
end
