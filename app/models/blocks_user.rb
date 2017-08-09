class BlocksUser < ApplicationRecord
  belongs_to :block
  belongs_to :user
end
