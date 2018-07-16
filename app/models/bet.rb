class Bet < ActiveRecord::Base
   belongs_to :user
   belongs_to :fixture
   validates  :bettype, presence: true
   validates  :fixture_id, presence: true
   validates  :user_id, presence: true
   validates  :result, presence: false




end