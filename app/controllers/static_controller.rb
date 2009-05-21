class StaticController < ApplicationController

  skip_before_filter :login_required

  def tour
  end

  def faq
  end

  def contact
  end

  def toc
  end

  def privacy
  end

  def about
  end

  def pricing
  end

  def index
    
  end

end
