module ApplicationHelper
  def base_image_url 
    ENV["MOVIEDB_IMAGE_BASE_URL"]
  end
end
