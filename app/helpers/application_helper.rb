# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Title helper taken from http://railscasts.com/episodes/30-pretty-page-title
  def title(page_title)
    content_for(:title) { page_title }
  end
end
