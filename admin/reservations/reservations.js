Array.from(document.querySelectorAll('.reservationsTable select')).forEach(element => {
  element.addEventListener('change', e => {
    if (element.value !== '0') {
      document.getElementById(element.dataset.formId).submit();
    }
  });
});