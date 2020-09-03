window.addEventListener('input', function(){
  const price = document.getElementById('item-price').value;
  const addTaxPrice = Math.round(price * 0.1);
  const profit = Math.round(price - addTaxPrice);
  document.getElementById('add-tax-price').innerText = addTaxPrice.toLocaleString("jp");
  document.getElementById('profit').innerText = profit.toLocaleString("jp");
})