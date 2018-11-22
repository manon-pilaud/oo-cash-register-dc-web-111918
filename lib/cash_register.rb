require 'pry'

class CashRegister
  attr_accessor :total, :discount, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title,price,quantity=1)
    price = price * quantity
    self.total += price
    #Ask about |= vs. quantity.times do + ask about why not quantity.times do |i|- Doc confusing.
    quantity.times do
      items << title
    end
    self.last_transaction = price * quantity
  end

  def apply_discount
    if discount != 0
      self.total = (self.total*(100-self.discount)) / 100
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
     self.total -= self.last_transaction
  end
end
