class Thread
  include DataMapper::Resource

  property :id, Serial
  property :title, String, required: true
  property :content, String, required: true
  property :date, Date
end