DataMapper.setup(:default, "sqlite:#{Dir.pwd}/db/main.db")

class Post
  include DataMapper::Resource

  property :id, Serial
  property :date, Date, :required => true, :default => Time.now
  property :title, String, :required => true, :unique => true, :messages => {:presence  => "Title can not be a empty", :is_unique => "Title must be a unique"}
  property :body, Text, :required => true, :unique => true, :messages => {:presence  => "Body can not be a empty", :is_unique => "Body must be a unique"}
  property :draft, Boolean, :default => true

  belongs_to :tag
end

class Tag
  include DataMapper::Resource

  property :id, Serial
  property :tag, String, :required => true, :unique => true, :messages => {:presence => "Tags can not be a empty"}

  has n, :post
end

class Page
  include DataMapper::Resource
  property :id, Serial
  property :urn, String, :required => true
  property :title, String, :required => true, :unique => true
  property :body, Text, :required => true, :unique => true
end

DataMapper.finalize
DataMapper.auto_upgrade!