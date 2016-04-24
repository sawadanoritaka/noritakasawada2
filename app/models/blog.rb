class Blog < ActiveRecord::Base
 belongs_to :user
 has/many :comments
end
