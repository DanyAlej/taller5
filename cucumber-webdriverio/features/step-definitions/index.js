var {Given} = require('cucumber');
var {When} = require('cucumber');
var {Then} = require('cucumber');
var {expect} = require('chai');
const sleep = (waitTimeInMs) => new Promise(resolve => setTimeout(resolve, waitTimeInMs));

Given('I go to losestudiantes home screen', () => {
  browser.url('/');
  if($('button=Cerrar').isDisplayed()) {
    $('button=Cerrar').click();
  }
});

When('I fill a wrong email and password', () => {
  var cajaLogIn = $('.cajaLogIn');

  var mailInput = cajaLogIn.$('input[name="correo"]');
  mailInput.click();
  mailInput.setValue('wrongemail@example.com');

  var passwordInput = cajaLogIn.$('input[name="password"]');
  passwordInput.click();
  passwordInput.setValue('123467891');
});

When('I try to login', () => {
  var cajaLogIn = $('.cajaLogIn');
  cajaLogIn.$('button=Ingresar').click();
});

Then('I expect to not be able to login', () => {
  $('.aviso.alert.alert-danger').waitForDisplayed(5000);
});


When('I open the login screen', () => {
  $('button=Ingresar').waitForExist(5000);
  $('button=Ingresar').waitForDisplayed(5000);
  $('button=Ingresar').click();
});

When(/^I fill with (.*) and (.*)$/ , (email, password) => {
  var cajaLogIn = $('.cajaLogIn');

 var mailInput = cajaLogIn.$('input[name="correo"]');
 mailInput.click();
 mailInput.keys(email);

 var passwordInput = cajaLogIn.$('input[name="password"]');
 passwordInput.click();
 passwordInput.keys(password)
});

Then('I expect to see popup {string}', (error) => {
    $('div[class="text-muted lead"]').waitForExist(5000);
    var h2Text = browser.$('div[class="text-muted lead"]').getText();
    expect(h2Text).to.include(error);
});

Then('I expect to see the account avatar', () => {
  browser.$('.cuenta');
});

Then('I expect to see {string}', error => {
    $('.aviso.alert.alert-danger').waitForDisplayed(5000);
    var alertText = browser.$('.aviso.alert.alert-danger').getText();
    expect(alertText).to.include(error);
});


// REGISTRATION

Then('I expect pop up {string}', (error) => {
 $('.text-muted lead').waitForDisplayed(5000);
 var alertText = browser.$('text-muted lead').getText();
 expect(alertText).to.include(error);
});

When("I open the 'ingresar' screen", () => {
  $('button=Ingresar').waitForExist(5000);
  $('button=Ingresar').waitForDisplayed(5000);
  $('button=Ingresar').click();
});

When(/^Put input with (.*) with (.*) with (.*) with (.*) with (.*) with (.*) with (.*) and (.*)$/ , (name, lastname, email, university, maestria, undergrad, password, conditions) => {
  var cajaSignUp = $('.cajaSignUp');

  cajaSignUp.$('input[name="nombre"]').waitForExist(5000);
  cajaSignUp.$('input[name="nombre"]').waitForDisplayed(5000);

  var nameInput = cajaSignUp.$('input[name="nombre"]');
  nameInput.click();
  nameInput.keys(name);

  var lastnameInput = cajaSignUp.$('input[name="apellido"]');
  lastnameInput.click();
  lastnameInput.keys(lastname);

  var mailInput = cajaSignUp.$('input[name="correo"]');
  mailInput.click();
  mailInput.keys(email);

  var universityCombobox = cajaSignUp.$('select[name="idUniversidad"]');
  var universidad = university.toLowerCase().split(' ').join('-');
  var universityOption = universityCombobox.$(`option[value="${universidad}"]`);
  universityOption.click();

  if ( maestria === 'yes') {
    var maestriaCheckbox = $('input=Estudio una maestria');
    check(maestriaCheckbox);
  }

  var undergradCombobox = cajaSignUp.$('select[name="idPrograma"]');
  var undergradOption = undergradCombobox.$(`option[value="22"]`);
  undergradOption.click();

  var passwordInput = cajaSignUp.$('input[name="password"]');
  passwordInput.click();
  passwordInput.keys(password);

  if(conditions === 'yes'){
    var checkTerms = cajaSignUp.$('input[name="acepta"]');
    checkTerms.click();
  }

});

When('I try to register', () => {
    var cajaSignUp = $('.cajaSignUp');
    cajaSignUp.$('button=Registrarse').click();

  sleep(10000).then(() => {
  });
});

