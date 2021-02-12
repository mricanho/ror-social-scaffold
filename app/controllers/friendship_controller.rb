class FriendshipController < ApplicationController
    def new
        @friendship = Friendship.new
    end

    def show; 
    end

    def create
      @friendship = Friendship.new(friendship_params)
      if @friendship.save
        flash[:notice] = 'You sent a Friendship request'
      else
        flash[:notice] = 'You failed to send a Friendship request'
      end
        friendship_redirect
    end

    def friendship_params
      params.require(:friendship).permit(:friend_id, :user_id, :id)
    end

    def friendship_redirect
      redirect_back(fallback_location: root_path)
    end
end