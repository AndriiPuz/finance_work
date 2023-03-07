class ApplicationController < ActionController::Base
  include Pagy::Backend

  def not_found_method
    render file: "#{Rails.root}/public/404.html", status: :not_found, layout: false
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  def render_404
    render file: "#{Rails.root}/public/404.html", status: :not_found
  end
end
