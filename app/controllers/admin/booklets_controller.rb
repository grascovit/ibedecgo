class Admin::BookletsController < AdminController
  before_action :set_booklet, only: %i[show edit update destroy]

  # GET /booklets
  def index
    @booklets = Booklet.by_created_date
  end

  # GET /booklets/1
  def show; end

  # GET /booklets/new
  def new
    @booklet = Booklet.new
  end

  # GET /booklets/1/edit
  def edit; end

  # POST /booklets
  def create
    @booklet = Booklet.new(booklet_params)
    @booklet.user = current_user

    if @booklet.save
      redirect_to admin_booklet_url(@booklet), notice: 'Cartilha criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /booklets/1
  def update
    if @booklet.update(booklet_params)
      redirect_to admin_booklet_url(@booklet), notice: 'Cartilha atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /booklets/1
  def destroy
    @booklet.destroy
    redirect_to admin_booklets_url, notice: 'Cartilha excluída com sucesso.'
  end

  private

  def set_booklet
    @booklet = Booklet.find(params[:id])
  end

  def booklet_params
    params.require(:booklet).permit(
      :title,
      :description,
      :year,
      :category,
      :attachment
    )
  end
end
