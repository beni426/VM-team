class Order
    
    attr_accessor :items , :selection, :product
    def self.initialize_product
        
        @items=[['coke',120,5],['water',100,5],['redbull',200,5]]
        end
    
    def self.purchase(product)
        @selection = product
        raise 'ストックございません' unless @items[find(product)][2]>0
        @items[find(product)][2]-=1
        return  @items[find(product)][0]
    end
    def self.restock(product, quatity)
        @items[find(product)][2]+=quatity
    end
    def self.find(product)
        @items.find_index{|item|item[0] == product}
    end
end