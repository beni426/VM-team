require_relative '/home/beni/workspace/teamwork/VM-team/originorder.rb'
class VendingMachine
    attr_reader :order, :product, :changes, :user_selection, :money, :items
    MONEY = [10, 50, 100, 500, 1000].freeze
    def initialize
        Order.initialize_product
        
        @user_selection=''
        @slot_money = 0
     
    end
    def current_money
      @slot_money
    end
    def slot_money(money)
      puts "#{money}円を入れました。"
     return false unless MONEY.include?(money)
     @slot_money += money
    end
    def return_money
      puts @slot_money
      @slot_money = 0
    end
    def get_change_required(current_money, product_cost)
      @change_required = current_money-product_cost
    end
    def get_stock
      Order.initialize_product.each do |product|
        add_product(product)
      end
    end
    def add_product(product)
      puts "#{product[0]} の在庫の数を増やす"
      quatity = gets.chomp.to_i
      Order.restock(product[0], quatity)
    end
    def add_money
      slot_money(money)
    end
   def select_product
     puts "ドリンクをお選びください"
     Order.initialize_product.each{|product|puts "#{product[0]}:#{product[1]}"}
      @user_selection= gets.chomp
      return "おかねを追加します" unless current_money_enough?
  end
  def current_money_enough?
    current_money >= Order.initialize_product[@user_selection.to_i][1]
  end
 

  def get_change
    get_change_required(current_money,  Order.initialize_product[@user_selection.to_i][1])
  end
  def current_stock
  
  end
end


# require_relative '/home/beni/workspace/teamwork/css/origin.rb'
# vm=VendingMachine.new
# vm.slot_money(100)
# vm.current_money
# vm.select_product
#vm.get_change
