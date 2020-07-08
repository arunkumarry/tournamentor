class MatchesController < ApplicationController
	before_action :set_match, only: [:show, :edit, :update, :destroy]

	def index
		@matches = Match.where(tournament_id: params[:tournament_id])
		#binding.pry
	end

	def show
	end

	def edit
		#binding.pry
	end

	def edit_teams
		t_id = @match.tournament_id
		t_name = @match.winner
		team_1 = Team.find_by(tournament_id: t_id, name: t_name)
		@match.teams.delete(team_1.id)
		t_id2 = @match.teams[0]
		team_2 = Team.find_by(tournament_id: t_id, id: t_id2)
		binding.pry
		team_1.update_attributes(total_played: team_1.total_played+1, won: team_1.won+1)
		team_2.update_attributes(total_played: team_2.total_played+1, lost: team_2.lost+1)
	end

	def update
		respond_to do |format|
			if @match.update(match_params)
				self.edit_teams()
				format.html { redirect_to tournament_matches_path, notice: 'Match was updated successfully!' }
				format.json { render :show, status: :ok, location: @match }
			else
				format.html { render :edit }
				format.json { render json: @match.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	def set_match
		@match = Match.find(params[:id])
	end

	def match_params
		params.require(:match).permit(:status, :winner)
	end
end
