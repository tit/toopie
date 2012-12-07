get "/" do
  site_menu
  slim :site_index, :layout => :site_layout, :locals => {:posts => @posts, :enable_tags => @enable_tags, :disable_tags => @disable_tags, :pages => @pages}
end

get "/tags/:id" do
  site_menu
  @posts = @posts.all :tag => {:id => params[:id]}
  slim :site_index, :layout => :site_layout, :locals => {:posts => @posts, :enable_tags => @enable_tags, :disable_tags => @disable_tags, :pages => @pages}
end

get "/pages/:urn" do
  site_menu
  @page = @pages.all :urn => params[:urn]
  slim :site_pages, :layout => :site_layout, :locals => {:posts => @posts, :enable_tags => @enable_tags, :disable_tags => @disable_tags, :pages => @pages, :page => @page}
end