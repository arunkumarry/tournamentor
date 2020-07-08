class Match < ApplicationRecord
	serialize :teams, Array

	belongs_to :tournament
	#has_many :teams
end
