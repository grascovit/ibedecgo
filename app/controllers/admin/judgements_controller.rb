class Admin::JudgementsController < AdminController
  before_action :set_judgement, only: %i[show edit update destroy]

  # GET /judgements
  def index
    @judgements = Judgement.by_created_date
  end

  # GET /judgements/1
  def show; end

  # GET /judgements/new
  def new
    @judgement = Judgement.new
  end

  # GET /judgements/1/edit
  def edit; end

  # POST /judgements
  def create
    @judgement = Judgement.new(judgement_params)
    @judgement.user = current_user

    if @judgement.save
      redirect_to admin_judgement_url(@judgement), notice: 'Sentença criada com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /judgements/1
  def update
    if @judgement.update(judgement_params)
      redirect_to admin_judgement_url(@judgement), notice: 'Sentença atualizada com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /judgements/1
  def destroy
    @judgement.destroy
    redirect_to admin_judgements_url, notice: 'Sentença excluída com sucesso.'
  end

  private

  def set_judgement
    @judgement = Judgement.find(params[:id])
  end

  def judgement_params
    params.require(:judgement).permit(
      :title,
      :released_at,
      :category,
      :attachment
    )
  end
end
