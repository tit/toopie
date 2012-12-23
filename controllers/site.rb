before "/*" do
  @posts = Post.all :draft => false,
                    :order => :id.desc
  @categories = Category.all :order => :id.desc
  @enable_categories = @categories.all :id => @posts.map { |post| post.category.id },
                                       :order => :name.asc
  @disable_categories = @categories.all :id.not => @posts.map { |post| post.category.id },
                                        :order => :name.asc
  @pages = Page.all
end

get "/" do
  slim :site_index,
       :layout => :site_layout
end

get "/post/:id" do
  @post = @posts.all :id => params[:id]
  slim :site_post,
       :layout => :site_layout
end

get "/category/:id" do
  @posts = @posts.all :category => {:id => params[:id]}
  slim :site_index,
       :layout => :site_layout
end

get "/page/:urn" do
  @page = @pages.all :urn => params[:urn]
  slim :site_page,
       :layout => :site_layout
end