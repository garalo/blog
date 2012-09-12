class PostsController < ApplicationController
  before_filter :authenticate_user!, :except => [:show, :index] 
  # GET /posts
  # GET /posts.json
  def index
    # if params[:tag]
      puts " ------------->>>>tag var"
          #@posts = Post.tagged_with(params[:tag])
          # @posts = Post.tagged_with(params[:id])
          # @tags = tag_cloud
          
          # code in controller
   # options = {} # any search/pagination conditions go here
   # @tags = Post.tag_counts_on(:keywords)
   # klass = Post
   # # klass = klass.tagged_with("%params[:tags]%", :any => true)  
   # klass = klass.tagged_with(@keyword) if (@keyword = params[:keyword]).present?
   # @posts = klass.paginate( options )
   # @posts_by_month = Post.find(:all, :order => "created_at DESC").group_by { |post| post.created_at.strftime("%B %Y")}
        # # else 
         @tags = Post.tag_counts_on(:tags)
          # @tags = tag_cloud
          # # @posts = Post.all
          # @posts = Post.search(params[:search]).page(params[:page]).per(5)
          @posts = Post.joins(:tags).where(["tags.name = ?", params[:search]]).page(params[:page]).per(5)  
          # @categories = Category.all
          @posts_by_month = Post.find(:all, :order => "created_at DESC").group_by { |post| post.created_at.strftime("%B %Y")}
        # end
 
    if params[:category]
       #@posts =  Post.where("category = ?", params[:category])
       @posts = Post.joins(:categories).where(["categories.id = ?", params[:category]])  
    else 
         @posts = Post.all
         @categories = Category.all         
    end
    
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])
    @categories = Category.all
    @category = Category.find(params[:id])
    # @categories = Post.joins(:categories).where(["categories.id = ?", params[:category]])    
    # @comment = Comment.new
    @tags = Post.tag_counts_on(:tags) # tag clouds for sidebar
    # @tags = Tag.all # tag clouds for sidebar
    @posts_by_month = Post.find(:all, :order => "created_at DESC").group_by { |post| post.created_at.strftime("%B %Y")}

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    #@post = current_user.posts.new(params[:post])
    @post = Post.new(params[:post])
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :ok }
    end
  end
  
end
