class Tournament < ApplicationRecord
	has_many :matches
	has_many :teams
end
