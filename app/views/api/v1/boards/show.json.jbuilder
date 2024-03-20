json.extract! @board, :id, :name, :bio, :banner_url, :created_at
json.posts @board.comments do |post|
  json.extract! post, :id, :content, :attachment, :created_at
end
