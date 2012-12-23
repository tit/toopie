# encoding: utf-8

DataMapper.setup :default, "sqlite:#{Dir.pwd}/db/main.db"

class Post
  include DataMapper::Resource

  property :id, Serial
  property :date, Date, :default => Time.now
  property :title, String
  property :body, Text
  property :draft, Boolean

  belongs_to :category
end

class Category
  include DataMapper::Resource

  property :id, Serial
  property :name, String

  has n, :post
end

class Page
  include DataMapper::Resource

  property :id, Serial
  property :urn, String
  property :title, String
  property :body, Text
end

DataMapper.auto_upgrade!