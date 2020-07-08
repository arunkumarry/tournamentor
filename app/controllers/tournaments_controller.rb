class TournamentsController < ApplicationController
	before_action :set_tournament, only: [:show, :edit, :update, :destroy, :matches_for_tournament, :create_matches]

	def index
		@tournaments = Tournament.all
	end

	def show
		@teams = @tournament.teams
	end

	def new
		@tournament = Tournament.new
	end

	def create_matches
		teams = @tournament.teams.pluck(:id, :name)
		comb_teams = teams.combination(2).to_a * params[:tournament][:number_of_matches].to_i
		comb_teams.shuffle.each do |combi|
			mat_teams = []
			names = combi[0][1]+" v/s "+combi[1][1]
			mat_teams << combi[0][0]
			mat_teams << combi[1][0]
			Match.create(name: names, tournament_id: @tournament.id, teams: mat_teams)
		end
	end

	def create
		@tournament = Tournament.new(tournament_params)
		respond_to do |format|
			if @tournament.save
				teams = params[:tournament][:team_names].split(',')
				teams.each do |team|
					Team.create(name: team, tournament_id: @tournament.id)
				end
				self.create_matches()
				format.html { redirect_to @tournament, notice: 'Tournament was created successfully!'}
				format.json { render :show, status: :created, location: @tournament}
			else
				format.html { render :new }
				format.json { render json: @tournament.errors, status: :unprocessable_entity}
			end
		end
	end

	def update
		respond_to do |format|
			if @tournament.update(tournament_params)
				format.html { redirect_to @tournament, notice: 'Tournament was updated successfully!' }
				format.json { render :show, status: :ok, location: @tournament }
			else
				format.html { render :edit }
				format.json { render json: @tournament.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		@tournament.destroy
		respond_to do |format|
			format.html { redirect_to tournaments_url, notice: 'Tournament was successfully deleted.' }
			format.json { head :no_content }
		end
	end

	private
	def set_tournament
		@tournament = Tournament.includes(:matches).find(params[:id])
	end

	def tournament_params
		params.require(:tournament).permit(:name, :status)
	end
end
