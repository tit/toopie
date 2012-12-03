get "/admin" do
  protected!
  posts = Post.all
  tags = Tag.all
  pages = Page.all
  slim :admin_index, :layout => :admin_main, :locals => {:posts => posts, :tags => tags, :pages => pages}
end