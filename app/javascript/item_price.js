window.addEventListener('load', () => {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", () => {
    const inputValue = priceInput.value;
    const addTaxDom = document.getElementById("add-tax-price");
    addTaxDom.innerHTML = Math.floor(inputValue * 0.1)

    const TaxValue = Math.floor(inputValue * 0.1)
    const addProfitValue = document.getElementById("profit");
    // const price = Math.floor(inputValue - TaxValue)
    // console.log(price)
    addProfitValue.innerHTML = Math.floor(inputValue - TaxValue)
    // })
  })

});
