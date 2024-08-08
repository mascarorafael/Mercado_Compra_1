// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "@popperjs/core"
import "bootstrap"

document.addEventListener('DOMContentLoaded', () => {
  const addPhotoFieldButton = document.getElementById('add-photo-field');
  const photosContainer = document.getElementById('photos-container');

  addPhotoFieldButton.addEventListener('click', () => {
    // Cria um novo campo de entrada para fotos
    const newField = document.createElement('div');
    newField.classList.add('photo-field');
    newField.innerHTML = `
      <input type="file" name="product[photos][]" accept="image/*" />
    `;

    // Adiciona o novo campo ao contêiner de fotos
    photosContainer.appendChild(newField);
  });
});

// document.addEventListener('DOMContentLoaded', function () {
//   var carouselElement = document.querySelector('#product-carousel');
//   if (carouselElement) {
//     new bootstrap.Carousel(carouselElement, {
//       interval: 3000, // Intervalo de troca de slides em milissegundos
//       wrap: true
//     });
//   }
// });
