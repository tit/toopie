# encoding utf-8

require "rubygems"
require "sinatra"
require "data_mapper"
require "slim"

require "./models/main"
require "./helpers/main"
require "./controllers/site"
require "./controllers/admin"
require "./controllers/admin_posts"
require "./controllers/admin_tags"
require "./controllers/admin_pages"