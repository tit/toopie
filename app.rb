# encoding: utf-8

require "rubygems"
require "sinatra"
require "data_mapper"
require "slim"

require "./models/main"
require "./helpers/admin_protect"
require "./controllers/site"
require "./controllers/admin"