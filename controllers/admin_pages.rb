get "/admin/pages" do
  protected!
  pages = Page.all
  slim :admin_pages, :layout => :admin_main, :locals => {:pages => pages}
end