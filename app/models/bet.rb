class Bet < ActiveRecord::Base
   belongs_to :user
   belongs_to :fixture
   validates  :bettype, presence: true
   validates  :fixture_id, presence: true
   validates  :user_id, presence: true
   validates  :result, presence: false
   validates_uniqueness_of :user_id, :scope => :fixture_id


def self.search(search)
  #where("week = ? ", "#{search}") 
  where("id IN (SELECT bets.id FROM bets join fixtures on fixtures.id = bets.fixture_id WHERE fixtures.week = ?) ", "#{search}") 
end

end