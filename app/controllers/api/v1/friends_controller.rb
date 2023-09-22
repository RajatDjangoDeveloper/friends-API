class Api::V1::FriendsController < ApplicationController 
  def index
    friends = Friend.all 
  
    if friends
      render json: {status: "SUCCESS", message: "Fetched all the friends successfully", data: friends}, status: :ok
    else
      render json: friends.errors, status: :bad_request
    end
  end

  def create
    friend = Friend.new(friend_params)
  
    if friend.save
      render json: {status: "SUCCESS", message: "Friend : #{friend.name} created successfully!", data: friend}, status: :created
    else
      render json: friend.errors, status: :unprocessable_entity
    end
  end

  def show
    friend = Friend.find(params[:id])
    render json: { message: "Friend : #{friend.name} details", data: friend}
  end

  def update
    friend = Friend.find(params[:id])
    friend.update(friend_params)
    if friend.save
      render json: {status: "UPDATED", message: "Friend : #{friend.name} was updated successfully!", data: friend}, status: :updated
    else
      render json: friend.errors, status: :unprocessable_entity
    end
  end

  def destroy
    friend = Friend.destroy(params[:id])
    if friend.destroy
      render json: {status: "DELETED", message: "Friend : #{friend.name} was deleted successfully!", data: friend}, status: :deteted
    else
      render json: friend.errors, status: :unprocessable_entity
    end
  end

  private
  
  def friend_params
    params.require(:friend).permit(:name, :location, :email, :twitter, :phone)
  end
end