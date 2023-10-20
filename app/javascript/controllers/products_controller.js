import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["quantity", "product", "unit_price", "amount"]

  connect() {
    this.quantityTarget.focus()
  }
  
  isEmpty(param)
  {
    return param === ""
  }
  
  validateEmpty({ params })
  {
    const index = !!params.index ? params.index : null

    let quantityValue = this.quantityTargets[index-1].value
    let unitPriceValue = this.unit_priceTargets[index-1].value
    
    if (!!params.quantity)
      this.isEmpty(quantityValue) ? this.markInput(this.quantityTargets[index-1]) : this.unmarkInput(this.quantityTargets[index-1])
    else if (!!params.unitPrice)
      this.isEmpty(unitPriceValue) ? this.markInput(this.unit_priceTargets[index-1]) : this.unmarkInput(this.unit_priceTargets[index-1])
    else {}
   
  }
  
  markInput(input)
  {
    input.style.border = "2px solid red"
  }
  
  unmarkInput(input)
  {
    input.style.border = ""
  }

  getAmount({ params }) {
    const index = !!params.index ? params.index : null

    let quantityValue = this.quantityTargets[index-1].value
    let unitPriceValue = this.unit_priceTargets[index-1].value

    this.amountTargets[index-1].value = !(this.isEmpty(quantityValue) && this.isEmpty(unitPriceValue))
                                ? parseInt(quantityValue) * parseInt(unitPriceValue)
                                : 0
  }
}
