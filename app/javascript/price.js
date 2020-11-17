window.addEventListener('load', function(){
  const itemPrice = document.getElementById("item-price")
  
  itemPrice.addEventListener("keyup", () => {
    const addTaxPrice = document.getElementById("add-tax-price")
    const profit = document.getElementById("profit")
    const taxPrice = itemPrice.value * 0.1
    const profitPrice = itemPrice.value * 0.9
    addTaxPrice.innerHTML = Math.round(taxPrice)
    profit.innerHTML = Math.round(profitPrice)
  })

})