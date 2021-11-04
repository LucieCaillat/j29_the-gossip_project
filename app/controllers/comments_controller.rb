class CommentsController < ApplicationController
    def create
        Comment.create(content: params[:content], user: User.find_by(id: session[:user_id]), gossip: Gossip.find(params[:gossip_id]))
        redirect_to gossip_path(params[:gossip_id])
    end
end
