class Question < ApplicationRecord
  belongs_to :post
  before_save :set_default



  def set_default
    self.votes = nil
  end
end
