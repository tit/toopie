get "/" do
  posts = Post.all :draft => false
  slim :site_index, :layout => :site_main, :locals => {:posts => posts}
end