class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  before_action :session_login, only: [:new, :edit, :show]
  def index   #indexアクションの作成
    @blogs = Blog.all
    # binding.pry
    render 'index'
  end
  
  def new
    if params[:back]
    @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end
  
  def confirm
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id  #ここで、user_idに値を入れないといけない
    # puts "--------------debug"
    # puts @blog.user_id   
    render :new if @blog.invalid?
  end
  
  def create  #createアクションの作成
   @blog = Blog.new(blog_params)
   @blog.user_id = current_user.id #現在ログインしているuserのidをblogのuser_idカラムに挿入する。
  puts "--------------debug"
  puts @blog.user_id
  # @blog = current_user.blogs.build(blog_params)
   if @blog.save
     redirect_to blogs_path, notice: "ブログを作成しました！"
   else
     render 'new'
   end
  end
  
  def show  #詳細ページ表示
    # params[:id]
    @blog = Blog.find(params[:id])
    @favorite = current_user.favorites.find_by(blog_id: @blog.id)
  end
  
  def edit  #編集画面を表示
    @blog = Blog.find(params[:id])
  end
  
  def update  #更新
    # @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path,notice:"ブログを編集しました！"
    else
      render 'edit'
    end
  end
  
  def destroy  #削除
      @blog.destroy
      redirect_to blogs_path, notice:"ブログを削除しました！"
  end
  
  private        #StrongParametersの意味
  
  def blog_params 
    params.require(:blog).permit(:title, :content) #permitの中身だけを反映させる
  end
  
  def set_blog
    @blog = Blog.find(params[:id])
  end
  
  def session_login
    if session[:user_id] == nil
      redirect_to new_user_path
    end
  end
  
end

