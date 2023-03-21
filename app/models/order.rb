class Order < ApplicationRecord
    enum pay_type: {
        "Check" => 0,
        "Credit card" =>1,
        "Purchase order" =>2
    }
    validates :email, :address, :name, presence: true
    validates :pay_type , inclusion: { in: Order.pay_types.keys }

    has_many :line_items, dependent: :destroy

    def add_line_items_from_cart(cart)
        line_items.each do |item|
            item.cart_id = nil
            line_items << item
        end
    end
end
