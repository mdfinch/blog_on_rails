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
    end

    def destroy
        
    end

    def edit
        
    end
    
    def update
        
    end
end
