// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", function() {
  var menuToggle = document.getElementById("menu-toggle");
  var wrapper = document.getElementById("wrapper");

  menuToggle.addEventListener("click", function() {
    wrapper.classList.toggle("toggled");
  });
});
