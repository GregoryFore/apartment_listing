class ApartmentsController < ApplicationController
  before_action :set_apartment, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]


  # GET /apartments
  # GET /apartments.json
  def index
    @apartments = Apartment.all

  end

  # GET /apartments/1
  # GET /apartments/1.json
  def show
  end

  # GET /apartments/new
  def new
    if user_signed_in?
      @apartment = current_user.apartments.build
    else
      flash[:alert] = "You do not have permission to do this."
    end
  end

  # GET /apartments/1/edit
  def edit
  end

  # POST /apartments
  # POST /apartments.json
  def create

    @apartment = current_user.apartments.new(apartment_params)

    respond_to do |format|
      if @apartment.save
        format.html { redirect_to @apartment, notice: 'Apartment was successfully created.' }
        format.json { render :show, status: :created, location: @apartment }
      else
        format.html { render :new }
        format.json { render json: @apartment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /apartments/1
  # PATCH/PUT /apartments/1.json
  def update
    if user_signed_in?
      if current_user.id == @apartment.user_id
        respond_to do |format|
          if @apartment.update(apartment_params)
            format.html { redirect_to @apartment, notice: 'Apartment was successfully updated.' }
            format.json { render :show, status: :ok, location: @apartment }
          else
            format.html { render :edit }
            format.json { render json: @apartment.errors, status: :unprocessable_entity }
          end
        end
      else
        flash[:alert] = "You do not have permission to do this."
      end
    else
      flash[:alert] = "You do not have permission to do this."
    end
  end

  # DELETE /apartments/1
  # DELETE /apartments/1.json
  def destroy
    if user_signed_in?
      if current_user.id == @apartment.user_id
        @apartment.destroy
        respond_to do |format|
          format.html { redirect_to apartments_url, notice: 'Apartment was successfully destroyed.' }
          format.json { head :no_content }
        end
      else
        flash[:alert] = "You do not have permission to do this."
      end
    else
      flash[:alert] = "You do not have permission to do this."
    end
  end

  def search_all
    @apartments = Apartment.basic_search(params[:search_all])
    # raise params.inspect
    render 'searchresults.html.erb'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_apartment
      @apartment = Apartment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def apartment_params
      params.require(:apartment).permit(:address_1, :address_2, :city, :postal, :state, :country, :contact_info, :bm_name, :bm_phone, :bm_hours, :image)
    end

end
