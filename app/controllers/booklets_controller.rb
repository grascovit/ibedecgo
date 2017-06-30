class BookletsController < ApplicationController
  before_action :set_booklet

  def show; end

  private

  def set_booklet
    @booklet = Booklet.find(params[:id])
  end
end
