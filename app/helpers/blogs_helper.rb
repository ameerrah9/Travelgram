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
      content_tag(:h2) do
        "No blogs yet, create a blog now!".html_safe +
          link_to('Share', new_blog_path)
      end
    else
      content_tag(:h2, "Your Blogs:") +
        render(@user.blogs)
    end
  end
end

