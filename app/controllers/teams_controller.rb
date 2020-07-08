class TeamsController < ApplicationController
	before_action :set_team, only: [:show, :edit, :update, :destroy]

	def index
		@teams = Team.where(tournament_id: params[:tournament_id])
		#binding.pry
	end

	def show
	end

	def edit
		#binding.pry
	end

	def update
		respond_to do |format|
			if @team.update_attributes(for_runs: @team.for_runs+params[:team][:for_runs].to_i, for_overs: @team.for_overs+params[:team][:for_overs].to_f,
				against_runs: @team.against_runs+params[:team][:against_runs].to_i, against_overs: @team.against_overs+params[:team][:against_overs].to_f)
				format.html { redirect_to tournament_teams_path, notice: 'Match was updated successfully!' }
				format.json { render :show, status: :ok, location: @team }
			else
				format.html { render :edit }
				format.json { render json: @team.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	def set_team
		@team = Team.find(params[:id])
	end

	def team_params
		params.require(:team).permit(:for_runs, :for_overs, :against_runs, :against_overs)
	end
end
