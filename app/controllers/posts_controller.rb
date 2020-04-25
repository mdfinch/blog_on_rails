class PostsController < ApplicationController
    def index
        @posts = Post.all.order("id ASC")
    end

    def new
        
    end

    def create
        
    end

    def show
        
    end

    def destroy
        
    end

    def edit
        
    end
    
    def update
        
    end
end
