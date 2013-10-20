class FailsController < ApplicationController
  before_action :set_fail, only: [:show, :edit, :update, :destroy]

  # GET /fails
  # GET /fails.json
  def index
    @fails = Fail.all
  end

  # GET /fails/1
  # GET /fails/1.json
  def show
  end

  # GET /fails/new
  def new
    @fail = Fail.new
  end

  # GET /fails/1/edit
  def edit
  end

  # POST /fails
  # POST /fails.json
  def create
    @fail = Fail.new(fail_params)

    respond_to do |format|
      if @fail.save
        format.html { redirect_to @fail, notice: 'Fail was successfully created.' }
        format.json { render action: 'show', status: :created, location: @fail }
      else
        format.html { render action: 'new' }
        format.json { render json: @fail.errors, status: :unprocessable_entity }
      end
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
    respond_to do |format|
      format.html { redirect_to fails_url }
      format.json { head :no_content }
    end
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
