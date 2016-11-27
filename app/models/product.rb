class Product < ApplicationRecord
  belongs_to :supplier
  has_many :images
  belongs_to :user
  has_many :orders

  def sale_message
    if price.to_f < 10
      return "Discount item!"
    else
      return "Everyday value!"
    end
  end

  def tax
    price.to_f * 0.09
  end

  def total
    price.to_f + tax
  end

  def discounted?
    if price.to_f < 10
    end
  end

  # def discount_class_name
  #   if sale_message == "Discount item!"
  #     return "discount-item"
  #   else
  #     return ""
  #   end
  # end
end