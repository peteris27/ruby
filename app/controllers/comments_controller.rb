class CommentsController < ApplicationController
  http_basic_authenticate_with name: "Peteris", password: "secret", only: :destroy
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.create(comment_params)
    if @comment.persisted?
      redirect_to article_path(@article)
    else 
      render "articles/show", locals: { comment: @comment}
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
      params.require(:comment).permit(:commenter, :body)
    end
end
