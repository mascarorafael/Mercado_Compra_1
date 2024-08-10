// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

console.log('JavaScript carregado'); // Verifica se o JavaScript está sendo executado

document.addEventListener('DOMContentLoaded', () => {

  const addPhotoFieldButton = document.getElementById('add-photo-field');
  const photosContainer = document.getElementById('photos-container');

  if (addPhotoFieldButton && photosContainer) {
    addPhotoFieldButton.addEventListener('click', () => {
      // Cria um novo campo de entrada para fotos
      const newField = document.createElement('div');
      newField.classList.add('photo-field', 'mb-3');
      newField.innerHTML = `
        <input type="file" name="product[photos][]" accept="image/*" />
      `;
      // Adiciona o novo campo ao contêiner de fotos
      photosContainer.appendChild(newField);
    });
  }
});

document.addEventListener('DOMContentLoaded', () => {
  const form = document.querySelector('form'); // Selecione o formulário
  form.addEventListener('submit', (event) => {
    const requiredFields = form.querySelectorAll('input[required]'); // Selecione todos os campos obrigatórios
    let isValid = true;

    requiredFields.forEach(field => {
      if (!field.value.trim()) { // Verifica se o campo está vazio
        field.classList.add('error'); // Adiciona a classe 'error'
        isValid = false;
      } else {
        field.classList.remove('error'); // Remove a classe 'error' se o campo não estiver vazio
      }
    });

    if (!isValid) {
      event.preventDefault(); // Impede o envio do formulário se algum campo obrigatório estiver vazio
    }
  });
});

document.addEventListener('DOMContentLoaded', () => {
  const addPhotoFieldButton = document.getElementById('add-photo-field');
  const photosContainer = document.querySelector('.form-inputs');

  addPhotoFieldButton.addEventListener('click', () => {
    // Cria um novo campo de entrada para fotos
    const newField = document.createElement('div');
    newField.classList.add('photo-field');
    newField.innerHTML = `
      <input type="file" name="product[photos][]" accept="image/*" class="backgroud-input" />
    `;

    // Insere o novo campo acima do botão
    photosContainer.insertBefore(newField, addPhotoFieldButton);
  });
});
