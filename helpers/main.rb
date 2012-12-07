helpers do
  def protected!
    unless authorized?
      response["WWW-Authenticate"] = %(Basic realm="Restricted Area")
      throw(:halt, [401, "Not authorized\n"])
    end
  end
  def authorized?
    @auth ||=  Rack::Auth::Basic::Request.new(request.env)
    @auth.provided? && @auth.basic? && @auth.credentials && @auth.credentials == ["admin", "admin"]
  end
  def site_menu
    @posts = Post.all :draft => false, :order => :id.desc
    @enable_tags = Tag.all :id => @posts.map {|post| post.tag.id}, :order => :tag.asc
    @disable_tags = Tag.all :id.not => @posts.map {|post| post.tag.id}, :order => :tag.asc
    @pages = Page.all
  end
end