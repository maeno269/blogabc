class Comment < ActiveRecord::Base
  belongs_to :write
  belongs_to :user
end
