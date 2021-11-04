class GossipsController < ApplicationController
  before_action :authenticate_user, only: [:index]

  # GET /gossips or /gossips.json
  def index
    @gossips = Gossip.all
  end

  # GET /gossips/1 or /gossips/1.json
  def show
    @gossip = Gossip.find(params[:id])
  end

  # GET /gossips/new
  def new
    @gossip = Gossip.new
  end

  # GET /gossips/1/edit
  def edit
    @gossip = Gossip.find(params[:id])
  end

  # POST /gossips or /gossips.json
  def create
    @gossip = Gossip.create(title: params[:title], content: params[:content], user: User.find_by(id: session[:user_id]))  

    if @gossip.save
      redirect_to gossips_path, notice: "Votre nouveau potin a bien été enregistré"
    else
      flash.now[:alert] = "mauvaises entrées de formulaire"
      render :action => 'new'
    end
  end

  # PATCH/PUT /gossips/1 or /gossips/1.json
  def update
    gossip = Gossip.find(params[:id])
    gossip.title = params[:title]
    gossip.content = params[:content]
    if gossip.save
      redirect_to gossips_path, notice: "Le gossip à bien été modifier"
    else
      flash.now[:alert] = "mauvaises entrées de formulaire"
      render :action => 'new'
    end
  end

  # DELETE /gossips/1 or /gossips/1.json
  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    respond_to do |format|
      format.html { redirect_to gossips_url, notice: "Gossip was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_gossip
      @gossip = Gossip.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def gossip_params
      params.require(:gossip).permit(:title, :content)
    end

    def authenticate_user
      unless current_user
        flash[:danger] = "Please log in."
        redirect_to new_session_path
      end
    end
    
end
