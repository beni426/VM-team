require_relative '/home/beni/workspace/teamwork/VM-team/originorder.rb'
class VendingMachine
    attr_accessor :order, :product, :changes, :user_selection, :money, :initialize_product
    MONEY = [10, 50, 100, 500, 1000].freeze
    def initialize
        @order=Order.initialize_product
        @user_selection=''
        @slot_money = 0
        @total_sales = 0
        
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
      return current_money

    end
    def get_stock
       Order.initialize_product.each do |product|
        add_product(product)
      end
    end
    def add_product(product)
      puts "#{product[0]} の在庫の数を増やす"
      quatity = gets.chomp.to_i
      Order.initialize_product.restock(product[0], quatity)
    end
    def get_product_list
      Order.initialize_product.each{|product|puts "在庫ありの商品：#{product[0]}" if product[2]>0} 
    end

   def select_product
       get_product_list
     puts "購入可能なドリンクをお選びください: 0: 'coke',1:'water',2: 'redbull'"
     Order.initialize_product.each{|product|puts "#{product[0]}:#{product[1]} " if current_money >= product[1] }
      @user_selection= gets.chomp
      puts "お客様が"+ Order.initialize_product[@user_selection.to_i][0] +"を購入しました"
      Order.initialize_product[@user_selection.to_i][2]-1
         get_change
         @slot_money= @slot_money-Order.initialize_product[@user_selection.to_i][1]
         @total_sales += Order.initialize_product[@user_selection.to_i][1] 
  end
  # def choose(product)
  #   @selection = product
  #   raise 'ストックございません' unless Order.initialize_product[@user_selection.to_i][2] >0
  #   Order.initialize_product[@user_selection.to_i][2]-1
  #   return  Order.initialize_product[@user_selection.to_i][0]
  # end

  
  def get_change
    get_change_required(current_money,  Order.initialize_product[@user_selection.to_i][1])
  end
  def current_stock
    array=[Order.initialize_product[@user_selection.to_i][0],Order.initialize_product[@user_selection.to_i][2]-1]
    puts array
    # Order.initialize_product[@user_selection.to_i][2]=Order.initialize_product[@user_selection.to_i][2]-1 
  end
  def total_sales
    puts '現在の売上を表示'
    @total_sales
  end

end


# require_relative '/home/beni/workspace/teamwork/VM-team/origin.rb'
# vm=VendingMachine.new
# vm.slot_money(100)
# vm.current_money
# vm.get_product_list
# vm.select_product
# vm.get_change
# vm.total_sales
# vm.current_stock

