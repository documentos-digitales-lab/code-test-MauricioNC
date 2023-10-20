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
    let quantity = this.quantityTarget.value
    let unit_price = this.unit_priceTarget.value
   
    if (!!params.quantity)
      this.isEmpty(quantity) ? this.markInput(this.quantityTarget) : this.unmarkInput(this.quantityTarget)
    else if (!!params.unitPrice)
      this.isEmpty(unit_price) ? this.markInput(this.unit_priceTarget) : this.unmarkInput(this.unit_priceTarget)
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

  getAmount() {
    let quantity = this.quantityTarget.value
    let unit_price = this.unit_priceTarget.value

    this.amountTarget.value = !(this.isEmpty(quantity) && this.isEmpty(unit_price))
                                ? parseInt(quantity) * parseInt(unit_price)
                                : 0
  }
}
