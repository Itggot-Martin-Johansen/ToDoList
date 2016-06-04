class User_rank
  include DataMapper::Resource

  property :id, Serial
  property :toggle, Boolean
  property :user_id, Integer
  property :rank_id, Integer
end