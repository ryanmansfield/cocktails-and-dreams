import "bootstrap";
import AOS from 'aos';

  var checkBoxes = document.querySelectorAll(".form-check-input");
  var form = document.querySelector('form');

  for (const check of checkBoxes) {
  check.addEventListener( 'change', function() {
    Rails.fire(form, 'submit');
  });
  }



$ (function () {
  AOS.init ();
});
