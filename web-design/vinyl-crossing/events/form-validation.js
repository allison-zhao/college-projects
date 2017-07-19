var subscribeForm = document.querySelector('form');

function validateForm(e) {
  var firstnameField = document.querySelectorAll('input')[0];
  var lastnameField = document.querySelectorAll('input')[1];
  var emailField = document.querySelectorAll('input')[2];
  var emailLabel = document.querySelectorAll('label')[2];
  var firstnameValid, lastnameValid, emailValid;

  if (firstnameField.value == null || firstnameField.value == '') {
    firstnameValid = false;
    firstnameField.className = "incomplete";
  } else {
    firstnameValid = true;
    firstnameField.className = "complete";
  }

  if (lastnameField.value == null || lastnameField.value == '') {
    lastnameValid = false;
    lastnameField.className = "incomplete";
  } else {
    lastnameValid = true;
    lastnameField.className = "complete";
  }

  if (emailField.value == null || emailField.value == '') {
    emailValid = false;
    emailField.className = "incomplete";
  } else if (emailField.value.indexOf('@') == -1) { // if no @ symbol
    emailValid = false;
    emailField.className = "incomplete";
    emailLabel.textContent = "Please enter a valid email address";
  } else {
    emailLabel.textContent = 'Email';
    emailValid = true;
    emailField.className = "complete";
  }

  if (firstnameValid == false || lastnameValid == false || emailValid == false) {
    e.preventDefault(); // don't submit form
  }
}

subscribeForm.addEventListener('submit', validateForm, false);