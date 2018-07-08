class Fixture < ActiveRecord::Base
has_many :bets
validates :description, presence: true
#validates :hometeam, presence: true
#validates :awayteam, presence: true
validates :due, presence: true
end