window.addEventListener('load', function(){

  const itemprices = document.getElementById("item-price")
  const taxprice = document.getElementById("add-tax-price")
  const profit = document.getElementById("profit")


  itemprices.addEventListener('keyup', function(){
    let itemprice = itemprices.value;
    console.log(itemprice)
    const tax = itemprice * 0.1;
    console.log(tax)
    taxprice.innerHTML = Math.round(tax)
    profit.innerHTML = taxprice.innerHTML

  })
})
