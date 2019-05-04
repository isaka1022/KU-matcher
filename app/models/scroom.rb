class Scroom < ApplicationRecord
  belongs_to :student
  belongs_to :company
  has_many :scmessages
end
