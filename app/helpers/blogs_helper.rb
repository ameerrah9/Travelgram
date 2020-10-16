module BlogsHelper
  def index_header
    if @user
      content_tag(:h1, "#{@user.username}'s Blogs:")
    else
      content_tag(:h2, "All Blogs")
    end
  end

  def display_blogs

    if @user.blogs.empty?
      content_tag(:h2, "No blogs yet, create a blog now!<a href='/blogs/new'>Share</a>")
    else
      content_tag(:h2, "Your Blogs:")
      render partial: "blogs/blogs", locals: {blogs: @user.blogs}
    end
  end
end

