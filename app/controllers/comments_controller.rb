class CommentsController < ApplicationController
  before_filter :load_commentable
  
  def index
    @comments = @commentable.comments
  end

  def new
    @comment = @commentable.comments.new
  end
    
  def create
     @comment = @commentable.comments.new(params.require(:comment).permit(:content))
    if @comment.save
      track_activity @comment
      redirect_to @comment, notice: "Comment created."
    else
      render :new
    end
  end
    
private

  def load_commentable
    resource, id = request.path.split('/')[1,2]
    @commentable = resource.singularize.classify.constantize.find(id)
  end

end