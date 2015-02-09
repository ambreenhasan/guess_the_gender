class User < ActiveRecord::Base
  validates :height, presence: true
  validates :weight, presence: true

  validates :height, numericality: true
  validates :weight, numericality: true

  validates :height, inclusion: {in: 48..96}
  validates :weight, inclusion: {in: 50..700}
end
