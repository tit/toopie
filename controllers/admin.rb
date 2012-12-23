before "/admin/*" do
  protected!
end

get "/admin" do
  @posts = Post.all
  @categories = Category.all
  @pages = Page.all
  slim :admin_index,
       :layout => :admin_layout
end

get "/admin/categories" do
  @categories = Category.all
  slim :admin_categories,
       :layout => :admin_layout
end

get "/admin/category/add" do
  slim :admin_category_add,
       :layout => :admin_layout
end

post "/admin/category/add" do
  Category.create :name => params[:category][:name]
  redirect "/admin/categories"
end

get "/admin/category/edit/:id" do
  @category = Category.get params[:id]
  slim :admin_category_edit,
       :layout => :admin_layout
end

post "/admin/category/edit" do
  category = Category.get params[:id]
  category.update :name => params[:category][:name]
  redirect "/admin/categories"
end

get "/admin/category/delete/:id" do
  category = Category.get params[:id]
  category.destroy if category != nil
  redirect "/admin/categories"
end

get "/admin/posts" do
  @posts = Post.all
  slim :admin_posts,
       :layout => :admin_layout
end

get "/admin/post/add" do
  @categories = Category.all
  slim :admin_post_add,
       :layout => :admin_layout
end

post "/admin/post/add" do
  if "on" == params[:post][:draft]
    draft = true
  else
    draft = false
  end
  Post.create :title => params[:post][:title],
              :body => params[:post][:body],
              :draft => draft,
              :category => Category.get(params[:category][:name])
  redirect "/admin/posts"
end

get "/admin/post/edit/:id" do
  @post = Post.get params[:id]
  @categories = Category.all
  slim :admin_post_edit,
       :layout => :admin_layout
end

post "/admin/post/edit" do
  if params[:post][:draft] == "on"
    draft = true
  else
    draft = false
  end
  post = Post.get params[:id]
  post.update :title => params[:post][:title],
              :body => params[:post][:body],
              :draft => draft,
              :category => Category.get(params[:category][:name])
  redirect "/admin/posts"
end

get "/admin/post/delete/:id" do
  post = Post.get params[:id]
  post.destroy if post != nil
  redirect "/admin/posts"
end

get "/admin/pages" do
  @pages = Page.all
  slim :admin_pages,
       :layout => :admin_layout
end

get "/admin/page/add" do
  slim :admin_page_add,
       :layout => :admin_layout
end

post "/admin/page/add" do
  Page.create :urn => params[:page][:urn],
              :title => params[:page][:title],
              :body => params[:page][:body]
  redirect "/admin/pages"
end

get "/admin/page/edit/:id" do
  @page = Page.get params[:id]
  slim :admin_page_edit,
       :layout => :admin_layout
end

post "/admin/page/edit" do
  page = Page.get params[:id]
  page.update :urn => params[:page][:urn],
              :title => params[:page][:title],
              :body => params[:page][:body]
  redirect "/admin/pages"
end

get "/admin/page/delete/:id" do
  page = Page.get params[:id]
  page.destroy if post != nil
  redirect "/admin/pages"
end