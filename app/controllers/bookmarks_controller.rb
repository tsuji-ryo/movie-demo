class BookmarksController < ApplicationController
  def toggle
    play_id = params[:play_id]
    user_bookmarks = current_user.bookmarks
    if user_bookmarks.exists?(play: play_id)
      user_bookmarks.where(play: play_id).destroy_all
    else
      user_bookmarks.create(user: current_user, play: Play.find(play_id))
    end
    render :nothing => true
  end
end
