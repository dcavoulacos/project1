class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    if vote_params[:comment_id].present?
      @vote = current_user.votes.where(:comment_id => params[:vote][:comment_id]).first 
      @vote ||= current_user.votes.create(vote_params)
      @vote.update_attributes(:up => params[:vote][:up])
    elsif vote_params[:post_id].present?
      @vote = current_user.votes.where(:post_id => params[:vote][:post_id]).first
      @vote ||= current_user.votes.create(vote_params)
      @vote.update_attributes(:up => params[:vote][:up])
    end
    redirect_to :back
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    redirect_to :back
    # respond_to do |format|
    #   format.html { redirect_to votes_url }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:post_id, :up, :comment_id)
    end
end
