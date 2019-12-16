const dateElements = Array.from(document.querySelectorAll('em[data-date]'));
const priceElements = Array.from(document.querySelectorAll('.reservationPrice'));

dateElements.forEach(element => {
  element.innerHTML = moment(element.dataset.date).format('DD MMM YYYY');
})

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

priceElements.forEach(element => {
  console.log(element.dataset.resSel)
  const checkInDate = moment(document.querySelector(`em[${element.dataset.resSel}-ci]`).dataset.date);
  const checkOutDate = moment(document.querySelector(`em[${element.dataset.resSel}-co]`).dataset.date);
  const totalStay = checkOutDate.diff(checkInDate, 'days');

  let totalPrice = 0;
  switch (element.dataset.cabinType) {
    case '0':
      totalPrice = 1200 * totalStay;
      break;
    case '1':
      totalPrice = 1700 * totalStay;
      break;
    case '2':
      totalPrice = 2500 * totalStay;
      break;
    default:
      break;
  }
  element.innerHTML = numberWithCommas(totalPrice);
})
