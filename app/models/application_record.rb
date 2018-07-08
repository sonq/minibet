class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
   config.time_zone = 'Eastern Time (US & Canada)'
end
