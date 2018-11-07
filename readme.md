This code was created to solve a problem i had. I needed to set a custom value in shopify checkout, a very custom value not supported by shopify's options

The idea is to have a high shipping rate to set the desired rate
Use the code in js file before trying with the ruby code in script editor
You cannot use zero and increase to the desired, because shopify doesn't allow doing it
Ex: you want the rate to be 10. Start with 99999, then you will discount the difference from the high rate `99999 - (99999 - 10)`, so the rate will be 10