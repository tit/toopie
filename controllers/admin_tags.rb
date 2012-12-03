get "/admin/tags" do
  protected!
  tags = Tag.all
  slim :admin_tags, :layout => :admin_main, :locals => {:tags => tags}
end

get "/admin/tags/add" do
  protected!
  slim :admin_tags_add, :layout => :admin_main
end

post "/admin/tags/add" do
  protected!
  Tag.create :tag => params[:tag]
  redirect "/admin/tags"
end

get "/admin/tags/edit/:id" do
  protected!
  tag = Tag.get params[:id]
  slim :admin_tags_edit, :layout => :admin_main, :locals => {:tag => tag}
end

post "/admin/tags/edit" do
  protected!
  tag = Tag.get params[:id]
  tag.update :tag => params[:tag]
  redirect "/admin/tags"
end

get "/admin/tags/delete/:id" do
  tag = Tag.get params[:id]
  tag.destroy if tag != nil
  redirect "/admin/tags"
end