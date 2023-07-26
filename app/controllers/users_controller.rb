class UsersController < ApplicationController
  before_action :set_user, only: [:show]
  def index
    @users = if params[:search_query]
               User.where('username LIKE ?', "%#{params[:search_query]}%")
             else
               []
             end
    render partial: 'layouts/search_results', locals: { users: @users } if turbo_frame_request?
  end

  def show
    @posts = @user.posts
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
