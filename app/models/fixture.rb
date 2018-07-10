class Fixture < ActiveRecord::Base
has_many :bets, dependent: :delete_all
validates :description, presence: true
#validates :hometeam, presence: true
#validates :awayteam, presence: true
validates :due, presence: true
end