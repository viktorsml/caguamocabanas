const closeSessionButton = document.getElementById('closeSession');
const userButton = document.getElementById('user');

function removeCookie(name) {
  document.cookie = name + '=; Path=/; Expires=Thu, 01 Jan 1970 00:00:01 GMT;';
}

// Let the document know when the mouse is being used
document.body.addEventListener('mousedown', e => {
  document.body.classList.add('using-mouse');
});

document.body.addEventListener('keydown', e => {
  if (e.key === 'Tab') {
    document.body.classList.remove('using-mouse');
  }
});

if (closeSessionButton) {
  closeSessionButton.addEventListener('click', e => {
    removeCookie('user');
    window.location.href = "/";
  })
}

if (userButton) {
  userButton.addEventListener('click', e => {
    document.getElementById('dropdownUser').classList.toggle('isVisible');
  })
}