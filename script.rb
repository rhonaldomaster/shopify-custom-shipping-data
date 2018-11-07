# set a high amount
shipping_price = Money.new(cents: 99999900)
found = false
property = ''
Input.cart.line_items.each do |line_item|
  product = line_item.variant.product
  next if product.gift_card?
  #set the value if it has't been found
  if line_item.properties['_shipping_price'] and !found
    found = true
    property = line_item.properties['_shipping_price']
    #transform the value to cents
    shipping_price = Money.new(cents: property.to_f) * 100
  end
end

Input.shipping_rates.each do |shipping_rate|
  reduced_rate = shipping_rate.price
  #if a value was found, discount the difference from the high rate
  unless property.empty?
    reduced_rate = shipping_rate.price - shipping_price
  end
  #apply the discount to the original rate
  if reduced_rate.cents <= 0
    shipping_rate.apply_discount(shipping_rate.price * 1, message: '')
  else
    shipping_rate.apply_discount(reduced_rate, message: '')
  end
end
Output.shipping_rates = Input.shipping_rates