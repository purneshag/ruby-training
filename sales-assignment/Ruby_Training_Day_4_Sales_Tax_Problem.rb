require_relative 'Bill'

class Checklist
  attr_accessor :items
  
  def initialize
    @items = []
  end

  def add_item(item_name, number_of_items, cost, is_it_imported, tax_exempt)
    @items << Billing.new(item_name, number_of_items, cost, is_it_imported, tax_exempt)
    puts "Item added!"
  end
  
  def calculate_sales_tax
    sales_tax = 0

    @items.each do |item|
      tax_rate = 0.10

      if item.tax_exempt == "yes"
        tax_rate = 0
      end

      if item.is_it_imported == "yes"
        tax_rate += 0.05
      end

      item_tax = ((item.cost * tax_rate).ceil.to_f ).round(2)
      sales_tax += item_tax
    end
    return sales_tax
  end

  def calculate_total_cost
    total_cost = 0
    @items.each do |item|
      total_cost += (item.cost*item.number_of_items)
    end
    total_cost += calculate_sales_tax
    return total_cost.round(2)
  end

  def print_receipt
    puts "RECEIPT:"
    puts "---------------------------------------"
    @items.each do |item|
      item_tax = 0
      tax_rate = 0.10

      if item.tax_exempt == "yes"
        tax_rate = 0
      end

      if item.is_it_imported == "yes"
        tax_rate += 0.05
      end

      item_tax = ((item.cost * tax_rate * item.number_of_items).ceil.to_f).round(2)

      puts "#{item.item_name}: #{(item.cost + item_tax).round(2)}"
    end
    puts "---------------------------------------"
    puts "Sales Taxes: #{calculate_sales_tax}"
    puts "Total: #{calculate_total_cost}"
  end
  
end

checklist = Checklist.new
puts "==>Enter the number of items to add: "
total_items = gets.chomp.to_i 
start = 0
loop do
  puts "==>Enter the name of item"
  item_name = gets
  puts "==>Enter the number of #{item_name}"
  number_of_items = gets.chomp.to_i
  puts "==>Enter the cost of #{item_name}"
  cost = gets.chomp.to_i
  puts "==>Is it imported! Enter 1. If yes, 2. If no"
  case (gets.chomp.to_i)
  when 1
    is_it_imported = "yes"
  when 2
    is_it_imported = "no"
  else
    puts "Invalid option"
    break
  end
  puts "Is it Tax Exempted! Enter 1. If yes, 2. If no"
  case (gets.chomp.to_i)
  when 1
    tax_exempt = "yes"
  when 2
    tax_exempt = "no"
  else
    puts "Invalid option"
    break
  end
  checklist.add_item(item_name, number_of_items, cost, is_it_imported, tax_exempt)
  start += 1
  break if start >= total_items
end
checklist.print_receipt

