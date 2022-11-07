class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @posts = Post.all
    @post = Post.new
  end

  def create
    @posts = Post.all
    @post = Post.new(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
    if @post.save
      flash[:notice] = "スケジュールを新規登録しました"
      redirect_to :posts
     else
      flash[:notice] = "登録に失敗しました"
       render "new"
    end

  end

  def show
    @posts = Post.all
    @post = Post.find(params[:id])
  end

  def edit
    @posts = Post.all
    @post = Post.find(params[:id])
  end

  def update
    @posts = Post.all
    @post = Post.find(params[:id])
     if @post.update(params.require(:post).permit(:title, :start_date, :end_date, :all_day, :memo))
       flash[:notice] = "IDが「#{@post.id}」の情報を更新しました"
       redirect_to :posts
     else
       flash[:notice] = "更新に失敗しました"
       render "edit"
     end

  end

  def destroy
    @posts = Post.all
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts


  end

  def to_bool
    if post.all_day == true
      ○
    else
      ×
    end
  end

end
