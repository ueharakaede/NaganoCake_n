class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_datails, dependent: :destroy

  validates :payment_method, presence: true
  validates :postal_code, presence: true, numericality: { only_integer: true }
  validates :address, presence: true
  validates :name, presence: true

  enum payment_method: {
    credit: 0,
    bank: 1,
  }

  enum status:{
    waiting: 0,
    paid_up: 1,
    making: 2,
    preparing: 3,
    shipped: 4,
  }

  def full_address
    '〒' + postal_code + ' ' + address + ' ' + name
  end

end
