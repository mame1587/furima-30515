window.addEventListener('load', function(){
const pullDownButton = document.getElementById("item-price")
  pullDownButton.addEventListener('input', function(){

    // console.log(ver item-price = document.forms.item-price.valuse;)
    // var input_message = document.getElementById("input_message").value;
    var input_price = document.getElementById("item-price").value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.round(input_price * 0.1);
    const proTaxDom = document.getElementById("profit");
    proTaxDom.innerHTML = Math.round(input_price * 0.9);
    console.log(input_price);
  })

})
