class Billing
    attr_accessor :item_name, :number_of_items, :cost, :is_it_imported, :tax_exempt
    
    def initialize(item_name, number_of_items, cost, is_it_imported, tax_exempt)
      @number_of_items = number_of_items
      @item_name = item_name
      @cost = cost
      @is_it_imported = is_it_imported
      @tax_exempt = tax_exempt
    end
end
