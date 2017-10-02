class Publisher < ApplicationRecord
	has_many :games, dependent: :destroy
end
