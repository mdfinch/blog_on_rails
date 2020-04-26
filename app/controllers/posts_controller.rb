class PostsController < ApplicationController
    def index
        @posts = Post.all.order("id DESC")
    end

    def new
        @post = Post.new 
    end

    def create
        @post = Post.new(params.require(:post).permit(:title, :body))
        if @post.save
            redirect_to posts_path
        else
            render :new
        end
    end

    def show
        @post = Post.find(params[:id])

        @comment = Comment.new
        @comments = @Post.comments.order(created_at: :desc)
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to posts_path
    end

    def edit
        @post = Post.find(params[:id])
    end
    
    def update
        @post = Post.find(params[:id])
        if @post.update(params.require(:post).permit(:title, :body))
            redirect_to posts_path(@post)
        else
            render :edit
        end
    end
end
