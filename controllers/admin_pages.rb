get "/admin/pages" do
  protected!
  pages = Page.all
  slim :admin_pages, :layout => :admin_layout, :locals => {:pages => pages}
end

get "/admin/pages/add" do
  protected!
  slim :admin_pages_add, :layout => :admin_layout
end

post "/admin/pages/add" do
  protected!
  Page.create :urn => params[:urn], :title => params[:title], :body => params[:body]
  redirect "/admin/pages"
end

get "/admin/pages/edit/:id" do
  protected!
  page = Page.get params[:id]
  slim :admin_pages_edit, :layout => :admin_layout, :locals => {:page => page}
end

post "/admin/pages/edit" do
  protected!
  page = Page.get params[:id]
  page.update :urn => params[:urn], :title => params[:title], :body => params[:body]
  redirect "/admin/posts"
end

get "/admin/pages/delete/:id" do
  page = Page.get params[:id]
  page.destroy if post != nil
  redirect "/admin/pages"
end