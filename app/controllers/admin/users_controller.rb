class Admin::UsersController < AdminController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  def index
    @users = User.by_first_name
  end

  # GET /users/1
  def show; end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to admin_user_url(@user), notice: 'Usuário criado com sucesso.'
    else
      render :new
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to admin_user_url(@user), notice: 'Usuário atualizado com sucesso.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to admin_users_url, notice: 'Usuário excluído com sucesso.'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :first_name,
      :last_name,
      :email,
      :password,
      :cpf,
      :phone,
      :gender,
      :birth_date,
      :avatar
    )
  end
end
