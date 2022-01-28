class CashRegister

    def initialize(employee_discount = 0)
        @total = 0
        @discount = employee_discount
        @items = []
    end

    attr_accessor :total, :discount, :items   

    def add_item(title, price, quantity = 1)
        @total += (price * quantity) 
        
        item_quantity = "#{title} " * quantity
        split_item_quantity = item_quantity.split(" ")
        split_item_quantity.each {|item| @items << item }
        
        #void_transaction
        @void_previous_price = price * quantity

        @void_title_quantity = quantity 
    end

    def apply_discount
        total_with_discount = @total - (@total * (discount.to_f / 100.0)) 
        @total = total_with_discount
        
        if @discount != 0 
            return "After the discount, the total comes to $#{@total.to_i}."
        else 
            return "There is no discount to apply."
        end 
    end 
    
    def void_last_transaction
        @total -= @void_previous_price
        @void_title_quantity.times {@items.pop}
    end 

end 
