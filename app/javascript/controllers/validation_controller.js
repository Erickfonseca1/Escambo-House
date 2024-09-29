import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["email", "password", "passwordConfirmation", "emailError", "passwordError", "passwordConfirmationError"]

  connect() {
    // Chama as validações ao carregar o controlador
    this.validateEmail();
    this.validatePassword();
    this.validatePasswordConfirmation();
  }

  validateEmail() {
    const email = this.emailTarget.value;
    const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

    if (!email) {
      this.emailErrorTarget.textContent = "O campo de e-mail está vazio.";
    } else if (!emailPattern.test(email)) {
      this.emailErrorTarget.textContent = "E-mail inválido.";
    } else {
      this.emailErrorTarget.textContent = "";
    }
  }

  validatePassword() {
    const password = this.passwordTarget.value;

    if (!password) {
      this.passwordErrorTarget.textContent = "O campo de senha está vazio.";
    } else if (password.length < 6) {
      this.passwordErrorTarget.textContent = "A senha deve ter pelo menos 6 caracteres.";
    } else {
      this.passwordErrorTarget.textContent = "";
    }
  }

  validatePasswordConfirmation() {
    const password = this.passwordTarget.value;
    const passwordConfirmation = this.passwordConfirmationTarget.value;

    if (!passwordConfirmation) {
      this.passwordConfirmationErrorTarget.textContent = "Confirmação de senha está vazia.";
    } else if (password !== passwordConfirmation) {
      this.passwordConfirmationErrorTarget.textContent = "As senhas não coincidem.";
    } else {
      this.passwordConfirmationErrorTarget.textContent = "";
    }
  }
}
