class CommentsController < ApplicationController
    #basic authentication
    http_basic_authenticate_with name: "shreya", password:"1234", only: [:destroy]

    #create comment
    def create
        @post = Post.find(params[:post_id])
        @comment = @post.comments.create(comment_params)
        redirect_to post_path(@post)
    end

    private def comment_params
        params.require(:comment).permit(:username, :body)
    end

    #delete comment
    def destroy
        @post = Post.find(params[:post_id])
        @comment = @post.comments.find(params[:id])
        @comment.destroy
        redirect_to post_path(@post)
    end
end