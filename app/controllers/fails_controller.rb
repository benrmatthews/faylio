class FailsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy

  def create
    @fail = current_user.fails.build(fail_params)
    if @fail.save
      flash[:success] = "Fail created!"
      redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def destroy
    @fail.destroy
    redirect_to root_url
  end

  private

    def fail_params
      params.require(:fail).permit(:headline)
    end

    def correct_user
      @fail = current_user.fails.find_by(id: params[:id])
      redirect_to root_url if @fail.nil?
    end
end