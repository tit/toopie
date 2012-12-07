get "/admin/posts" do
  protected!
  posts = Post.all
  slim :admin_posts, :layout => :admin_layout, :locals => {:posts => posts}
end

get "/admin/posts/add" do
  protected!
  tags = Tag.all
  slim :admin_posts_add, :layout => :admin_layout, :locals => {:tags => tags}
end

post "/admin/posts/add" do
  protected!
  if params[:draft] == "on"
    draft = true
  else
    draft = false
  end
  Post.create :title => params[:title], :body => params[:body], :draft => draft, :tag => Tag.get(params[:tag])
  redirect "/admin/posts"
end

get "/admin/posts/edit/:id" do
  protected!
  post = Post.get params[:id]
  tags = Tag.all
  slim :admin_posts_edit, :layout => :admin_layout, :locals => {:post => post, :tags => tags}
end

post "/admin/posts/edit" do
  protected!
  if params[:draft] == "on"
    draft = true
  else
    draft = false
  end
  post = Post.get params[:id]
  post.update :title => params[:title], :body => params[:body], :draft => draft, :tag => Tag.get(params[:tag])
  redirect "/admin/posts"
end

get "/admin/posts/delete/:id" do
  post = Post.get params[:id]
  post.destroy if post != nil
  redirect "/admin/posts"
end