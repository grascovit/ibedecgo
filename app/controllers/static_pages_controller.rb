class StaticPagesController < ApplicationController
  def about; end

  def booklets; end

  def contact; end

  def expertise; end

  def home
    @posts = Post.recent
  end

  def judgements
    @judgements = Judgement.by_created_date
  end

  def news
    @posts = Post.by_created_date
  end

  def videos; end
end
