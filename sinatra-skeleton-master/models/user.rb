class User
  include DataMapper::Resource

  property :id, Serial
  property :username, String, required: true, unique: true
  property :password, BCryptHash, required: true
  property :email, String, required: true, unique: true
  property :gender, String
  property :created_at, DateTime
end
