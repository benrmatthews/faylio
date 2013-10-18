class StaticPagesController < ApplicationController
  
  def home
    if signed_in?
      @fail  = current_user.fails.build
      @feed_items = current_user.feed.paginate(page: params[:page])
    end
  end

  def help
  end

  def about
  end

  def contact
  end

  def manifesto
  end

  def faqs
  end

  def support
  end

  def terms
  end

  def privacy
  end

  def security
  end
end
