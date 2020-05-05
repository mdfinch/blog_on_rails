class CommentsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]

    def create
        @post = Post.find(params[:post_id])
        @comment = Comment.new(params.require(:comment).permit(:body))
        @comment.post = @post
        @comment.user = current_user
        if @comment.save
            redirect_to post_path(@post), notice: "Comment created!"
        else
            @comments = @comment.posts.order(created_at: :desc)
            render 'posts/show'
        end
    end

    def destroy
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to post_path(@comment.post)
    end

end
