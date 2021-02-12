class FriendshipController < ApplicationController
    def new
        redirect_to users_url
    end
end