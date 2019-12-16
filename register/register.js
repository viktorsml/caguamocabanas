document.getElementById('registerForm').addEventListener('submit', e => {
  const password = document.getElementById('password').value;
  const passwordRepeat = document.getElementById('password-repeat').value;
  if (password !== passwordRepeat) {
    e.preventDefault();
    alert('Las contrasñeas no coinciden.');
    return;
  }
})