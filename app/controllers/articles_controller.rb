class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :update, :destroy]

  # GET /articles
  def index

    @articles = Article.all
    @articles.each do |article|

        if I18n.default_locale.to_s != article.original_language
          article.title = translate(article.title, I18n.default_locale)
          article.topic = translate(article.topic, I18n.default_locale)
          article.section = translate(article.section, I18n.default_locale)
          article.content = translate(article.content, I18n.default_locale)
          article.language =  I18n.default_locale.to_s
        end
    end


    render json: @articles
  end

  # GET /articles/1
  def show
    @article.questions.each do |question|
      question.answers.each do |answer|
        if I18n.default_locale.to_s != answer.language
          Answer.update(answer.id,
            title: translate(answer.title, I18n.default_locale),
            content: translate(answer.content, I18n.default_locale),
            language: I18n.default_locale)
        end
        end
        if I18n.default_locale.to_s != question.language
          Question.update(question.id,
            title: translate(question.title, I18n.default_locale),
            content: translate(question.content, I18n.default_locale),
            language: I18n.default_locale)
        end
    end


    @article = Article.find(@article.id)
    if I18n.default_locale.to_s != @article.original_language
      @article.title = translate(@article.title, I18n.default_locale)
      @article.topic = translate(@article.topic, I18n.default_locale)
      @article.section = translate(@article.section, I18n.default_locale)
      @article.content = translate(@article.content, I18n.default_locale)
      @article.language =  I18n.default_locale.to_s
    end



    render json: @article
  end

  def create
    @article = Article.new(article_params)

    if @article.save
      render json: @article, status: :created, location: @article, errors: []
    else
      render json: @article.errors, status: :unprocessable_entity
    end
  end


  def update

    if @article.update(article_params)

      render json: @article, status: 204, errors: []
    else

      render json: @article.errors, status: :unprocessable_entity, errors: []
    end
  end


  def destroy
    @article.destroy
  end

  private
    def set_article
      @article = Article.find(params[:id])
    end

    def article_params
      params.require(:article).permit(:title, :topic, :section, :content, :original_language, :language)
    end
end
