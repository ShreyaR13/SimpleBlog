class PostsController < ApplicationController
    # create method # its similar to 
    # def function(){

    # }

    #basic authentication
    http_basic_authenticate_with name: "shreya", password:"1234", except: [:index, :show]

    #display all posts
    def index       
        @posts = Post.all
    end

    #display individual post
    def show
        #we create a @post variable which represents the Post model so we write @post = Post and then .find
        @post = Post.find(params[:id])
    end

    def new
        @post = Post.new
    end

    #create new post
    def create
        # render plain: params[:post].inspect   =>this is to check if the data is being submitted
        #we create a @post variable which represents the Post model so we write @post = Post and then .new
        # @post = Post.new(params[:post]) =>it will throw an error as we haven't specified fields which a post is allowed to have
        @post = Post.new(post_params)        #so we write a private method to avoid the above error
        
        #this will save the post
        if(@post.save)
            #this is going to redirect the post to show view
            redirect_to post_url(@post)
        else
            render 'new'
        end
    end

    private def post_params
        params.require(:post).permit(:title, :body)
    end

    #display post to edit
    def edit
        @post = Post.find(params[:id])
    end

    #update post
    def update
        @post = Post.find(params[:id]) 

        if(@post.update(post_params))
            #this is going to redirect the post to show view
            redirect_to post_url(@post)
        else
            render 'edit'
        end
    end

    #delete post
    def destroy
            @post = Post.find(params[:id])
            @post.destroy

            redirect_to posts_path
    end

end
