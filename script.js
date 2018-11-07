/**
 * Here you set the desired value, you can use the first line item in the cart.
 * jquery is used, but you can use whatever you want.
 * The value 10 is an example
 */
var price = 10;
$.post('cart/change.js', {line: 1, properties: {_shipping_price: price}});