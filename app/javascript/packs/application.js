import "bootstrap";

  var checkBoxes = document.querySelectorAll(".form-check-input");
  var form = document.querySelector('form');

  for (const check of checkBoxes) {
  check.addEventListener( 'change', function() {
    Rails.fire(form, 'submit');
  });
  }



function replaceCocktails (innerHTML) {
  const cocktails = document.getElementById('cocktails');
  cocktails.innerHTML = innerHTML;
}
replaceCocktails("<%= j render 'cocktail', cocktails: @cocktails %>");
