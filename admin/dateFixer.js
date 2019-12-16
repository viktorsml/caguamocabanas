const dateElements = Array.from(document.querySelectorAll('*[data-date]'));

dateElements.forEach(element => {
  element.innerHTML = moment(element.dataset.date).format('DD MMM YYYY');
})