/**
 * Here you set the desired value, you can use the first line item in the cart.
 * jquery is used, but you can use whatever you want.
 * The value 10 is an example
 */
var price = 10;
var productQuantity = 1; // update with the appropiate quantity
var lineNumber = 1; // line numbers are 1-based
$.post('cart/change.js', {line: lineNumber, properties: {_shipping_price: price}, quantity: productQuantity});
