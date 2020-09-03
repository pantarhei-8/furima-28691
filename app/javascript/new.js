window.addEventListener('input', function(){
  const price = document.getElementById('item-price');
  const addTaxPrice = document.getElementById('add-tax-price').innerText = Math.round(price.value * 0.1);
  const profit = document.getElementById('profit').innerText = Math.round(price.value - addTaxPrice) ;
  // price.addEventListener('input', function() {
  // });
  // console.log(price.value);
  // console.log(addTaxPrice);
  // console.log(profit);
})