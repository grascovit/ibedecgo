class StaticPagesController < ApplicationController
  def about; end

  def booklets; end

  def contact; end

  def expertise; end

  def home
    @posts = Post.recent
  end

  def judgements; end

  def news; end

  def videos; end
end
