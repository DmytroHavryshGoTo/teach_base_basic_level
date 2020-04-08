class Carriage < ApplicationRecord
  belongs_to :train
  validates :number, :type, :train, presence: true
  validates :number, uniqueness: { scope: :train_id }
  before_validation :set_number

  CARRIAGE_TYPES = %w[DefaultCarriage CoupeCarriage PremiumCarriage SeatedCarriage]

  private

  def set_number
    self.number = max_number + 1
  end

  def max_number
    train.carriages.pluck(:number).max || 0
  end
end