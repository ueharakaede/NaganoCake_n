class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_datails, dependent: :destroy
  
  enum payment_method:{
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
  
end
