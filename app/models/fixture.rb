class Fixture < ActiveRecord::Base
validates :description, presence: true
#validates :hometeam, presence: true
#validates :awayteam, presence: true
validates :due, presence: true
end