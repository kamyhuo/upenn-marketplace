class ShopsController < ApplicationController
  before_action :set_shop, except: [:index, :new, :create]
  before_action :set_user, except: [:edit, :update]


  # GET /shops
  # GET /shops.json
  def index
    @shops = Shop.all
  end

  # GET /shops/1
  # GET /shops/1.json
  def show
    @users = User.all
  end

  # GET /shops/new
  def new
    @shop = Shop.new
  end

  # GET /shops/1/edit
  def edit
  end

  # POST /shops
  # POST /shops.json
  def create
    @shop = @user.shops.create(shop_params)

    respond_to do |format|
      if @shop.save
        format.html { redirect_to "/users/#{@user.id}/shops/#{@shop.id}"}
        format.json { render :show, status: :created, location: @shop }
      else
        format.html { render :new }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /shops/1
  # PATCH/PUT /shops/1.json
  def update
    respond_to do |format|
      if @shop.update(shop_params)
        format.html { redirect_to @shop}
        format.json { render :show, status: :ok, location: @shop }
      else
        format.html { render :edit }
        format.json { render json: @shop.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shops/1
  # DELETE /shops/1.json
  def destroy
    @user.shops.delete(@shop)
    @shop.destroy
    respond_to do |format|
      format.html { redirect_to shops_url }
      format.json { head :no_content }
    end
  end

  def add_user
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @shop.users << @user unless @shop.users.include?(@user)
    end
    redirect_to "/shops/#{@shop.id}"
  end

  def delete_user
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @shop.users.delete(@user)
    end
    redirect_to "/shops/#{@shop.id}"
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_shop
      @shop = Shop.find(params[:id])
    end   

    def set_user
       @user = current_user
   end

    # Never trust parameters from the scary internet, only allow the
    # white list through.
    def shop_params
      params.require(:shop).permit(:name, :description, :user_id)
    end
end
