class FailsController < ApplicationController
  before_action :signed_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  
  # GET /fails
  # GET /fails.json
  def index
    @fail = Fail.find_with_reputation(:votes, :all, order: 'votes desc')
  end

  # GET /fails/1
  # GET /fails/1.json
  def show
    @fail = Fail.find(params[:id])
    @commentable = @fail
    @comments = @commentable.comments
    @comment = Comment.new
  end
  
  # GET /fails/new
  def new
    @fail = Fail.new
  end

  # GET /fails/1/edit
  def edit
  end
  
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

  # PATCH/PUT /fails/1
  # PATCH/PUT /fails/1.json
  def update
    respond_to do |format|
      if @fail.update(fail_params)
        format.html { redirect_to @fail, notice: 'Fail was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @fail.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fails/1
  # DELETE /fails/1.json
  def destroy
    @fail.destroy
    redirect_to root_url
  end
  
  def vote
    value = params[:type] == "up" ? 1 : -1
    @fail = Fail.find(params[:id])
    redirect_to :back, notice: "Thank you for voting!"
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_fail
      @fail = Fail.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def fail_params
      params.require(:fail).permit(:headline, :description, :lesson, :link, :user_id)
    end
 
end
