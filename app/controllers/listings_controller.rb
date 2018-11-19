class ListingsController < ApplicationController
  before_action :set_listing, except: [:create, :new, :index]
  before_action :set_shop

  # GET /listings
  # GET /listings.json
  def index
    @listings = @shop.listings
  end

  # GET /listings/1
  # GET /listings/1.json
  def show
    @shops = Shop.all
  end

  # GET /listings/new
  def new
    @listing = Listing.new
  end

  # GET /listings/1/edit
  def edit
  end

  # POST /listings
  # POST /listings.json
  def create
    @listing = @shop.listings.create(listing_params)
    
    respond_to do |format|
      if @listing.save

        format.html { redirect_to "/shops/#{@shop.id}"}
        format.json { render :show, status: :created, location: @listing }
      else
        format.html { render :new }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /listings/1
  # PATCH/PUT /listings/1.json
  def update
    respond_to do |format|
      if @listing.update(listing_params)
        format.html { redirect_to "/shops/#{@shop.id}/listings/#{@listing.id}"}
        format.json { render :show, status: :ok, location: @listing }
      else
        format.html { render :edit }
        format.json { render json: @listing.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /listings/1
  # DELETE /listings/1.json
  def destroy
    @listing.destroy
    respond_to do |format|
      format.html { redirect_to "/shops/#{@shop.id}"}
      format.json { head :no_content }
    end
  end

  def state
    if @listing.state
      @listing.update_attribute(:state, params[:listing_state])
    else
      @listing.update_attribute(:state, !params[:listing_state])
    end
    redirect_back fallback_location: { action: 'show', id: @listing.id }
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_listing
      @listing = Listing.find(params[:id])
    end

    def set_shop
      @shop = Shop.find(params[:shop_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def listing_params
      params.require(:listing).permit(:title, :price, :state, :description, :shop_id, :avatar)
    end
end
