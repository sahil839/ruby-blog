class CommentsController < ApplicationController

 http_basic_authenticate_with name: "sahil839", password: "12345",
 only: :destroy

 def new
  @article = Article.find(params[:article_id])
  @comment = @article.Comments.new
 end
 
 def create
  @article = Article.find(params[:article_id])
  @comment = @article.comments.new(comment_params)
  if @comment.save
    redirect_to article_path(@article)
  end
 end
 
 def destroy
  @article = Article.find(params[:article_id])
  @comment = @article.comments.find(params[:id])
  @comment.destroy
  redirect_to article_path(@article)
 end
 
 private
  def comment_params
    params.require(:comment).permit(:commenter,:body)
  end
end
