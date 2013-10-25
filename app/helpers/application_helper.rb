module ApplicationHelper

  # Returns the Gravatar (http://gravatar.com/) for the given user.
  def gravatar_for(user)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar img-circle", size: "25")
  end
  
  def markdown
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
    :autolink => true, :space_after_headers => true, :hard_wrap => true, :filter_html=> true, :no_intraemphasis => true, :fenced_code => true, :gh_blockcode => true)
  end
end