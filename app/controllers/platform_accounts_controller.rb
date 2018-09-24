class PlatformAccountsController < ApplicationController
  before_action :set_platform_account, only: %i[show edit update destroy]
  before_action :authenticate_user!

  # GET /platform_accounts
  # GET /platform_accounts.json
  def index
    @platform_accounts = PlatformAccount.all
  end

  # GET /platform_accounts/1
  # GET /platform_accounts/1.json
  def show
  end

  # GET /platform_accounts/new
  def new
    @platform_account = PlatformAccount.new
  end

  # GET /platform_accounts/1/edit
  def edit
  end

  # POST /platform_accounts
  # POST /platform_accounts.json
  def create
    @platform_account = PlatformAccount.new(platform_account_params)

    respond_to do |format|
      if @platform_account.save
        format.html { redirect_to @platform_account, notice: 'Platform account was successfully created.' }
        format.json { render :show, status: :created, location: @platform_account }
      else
        format.html { render :new }
        format.json { render json: @platform_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /platform_accounts/1
  # PATCH/PUT /platform_accounts/1.json
  def update
    respond_to do |format|
      if @platform_account.update(platform_account_params)
        format.html { redirect_to @platform_account, notice: 'Platform account was successfully updated.' }
        format.json { render :show, status: :ok, location: @platform_account }
      else
        format.html { render :edit }
        format.json { render json: @platform_account.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /platform_accounts/1
  # DELETE /platform_accounts/1.json
  def destroy
    @platform_account.destroy
    respond_to do |format|
      format.html { redirect_to platform_accounts_url, notice: 'Platform account was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_platform_account
      @platform_account = PlatformAccount.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def platform_account_params
      params.require(:platform_account).permit(:platform_id, :member_id, :tag, :internal_link)
    end
end
