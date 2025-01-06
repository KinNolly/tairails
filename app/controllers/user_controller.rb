class UsersController < ApplicationController
    def create
        @user = User.new(user_params)
        if @user.save
          redirect_to users_path, notice: 'Người dùng đã được tạo thành công.'
        else
          alert = @user.errors.full_messages.to_sentence
          flash.now[:alert] = alert
          @user = User.new
          render :new
        end
    end

    private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email_address, :password, :password_confirmation, :name, :phone, :super_user, :featured_image)
    end
end