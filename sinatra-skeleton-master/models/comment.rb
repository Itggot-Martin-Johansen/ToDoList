class Comment
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :content, String, required: true
  property :user_id, Integer
  property :thread_id, Integer
  property :date, Date
end
