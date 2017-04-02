class StaticPagesController < ApplicationController
  skip_before_filter :authenticate_user_from_token!

  def root
  end
end
