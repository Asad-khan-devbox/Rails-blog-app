class ArticlesController < ApplicationController 
    before_action :set_article, only:[:show, :edit, :update, :destroy]
    before_action :require_user, except:[:show, :index]
    before_action :require_same_user, only:[:edit, :update, :destroy]


    def show
    end

    def index
        @articles = Article.paginate(page: params[:page], per_page: 2)

    end

    def new
        @article = Article.new
    end

    def edit 
    end

    def create
        @article = Article.new(article_parmas)
        @article.user = current_user
        if @article.save
            flash[:notice] = "Articel created Successfully."
            redirect_to @article
        else
            render 'new'
        end
    end

    def update
        if @article.update(article_parmas)
            flash[:notice] = "Article update Successfully."
            redirect_to @article
        else
            render 'edit'
        end

    end

    def destroy 
        if @article.destroy
            flash[:notice] = "Article deleted Successfully."
            redirect_to articles_path
        else
            render 'destroy'
        end
    end

    private 

    def set_article
        @article = Article.find(params[:id])
    end

    def article_parmas
        params.require(:article).permit(:title, :description)
    end

    def require_same_user
        if current_user != @article.user && !current_user.admin?
            flash[:notice] = "You can only edit , update and delete your own articles"
            redirect_to @article
        end
    end

end