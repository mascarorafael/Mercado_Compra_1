import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="photo-field"
export default class extends Controller {
  static targets = ["container"]

  addField() {
    const newField = document.createElement('div')
    newField.classList.add('photo-field', 'mb-3')
    newField.innerHTML = `
      <input type="file" name="product[photos][]" accept="image/*" />
    `
    this.containerTarget.appendChild(newField)
  }

  addFieldEdit() {
    const newField = document.createElement('div');
    newField.classList.add('photo-field');
    newField.innerHTML = `
      <input type="file" name="product[photos][]" accept="image/*" class="backgroud-input" />
    `;

    this.containerTarget.appendChild(newField)
  }
}
