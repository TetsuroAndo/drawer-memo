class ToppagesController < ApplicationController
  def index
    if logged_in?
      @memos = current_user.memos
    end
  end
end
