const checkIn = document.getElementById('checkIn');
const checkOut = document.getElementById('checkOut');

const minCheckInDate = moment(new Date()).add(3, 'd');
const minCheckOutDate = moment(new Date()).add(4, 'd');

const people = document.getElementById('people');
const cabinClassic = document.getElementById('cabinClassic');
const cabinFriends = document.getElementById('cabinFriends');
const cabinFamily = document.getElementById('cabinFamily');

const totalCostText = document.getElementById('totalCostText');
const totalCost = document.getElementById('totalCost');

const stepTwo = document.getElementById('stepTwo');
const stepThree = document.getElementById('stepThree');

function isEmpty(property) {
  return (property === null || property === "" || typeof property === "undefined");
}

function numberWithCommas(x) {
  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}

checkIn.setAttribute('min', minCheckInDate.format('YYYY-MM-DD'))
checkOut.setAttribute('min', minCheckOutDate.format('YYYY-MM-DD'))

checkIn.addEventListener('change', e => {
  checkOut.setAttribute('min', moment(checkIn.value).add(1, 'd').format('YYYY-MM-DD'))
});

people.addEventListener('change', e => {
  cabinClassic.disabled = (people.value > 2);
  cabinFriends.disabled = (people.value > 5);
  [cabinClassic, cabinFriends, cabinFamily].forEach(element => {
    element.checked = false;
  });
  document.getElementById('stepThree').classList.remove('isVisible');
  window.scrollTo({top: stepThree.offsetTop, behavior: 'smooth'});
});

[checkIn, checkOut, people].forEach(element => {
  element.addEventListener('change', e => {
    if (!isEmpty(checkIn.value) && !isEmpty(checkOut.value) && !isEmpty(people.value)) {
      stepTwo.classList.add('isVisible');
      window.scrollTo({top: stepTwo.offsetTop, behavior: 'smooth'});
    } else {
      stepTwo.classList.remove('isVisible');
    }
  });
});

[cabinClassic, cabinFriends, cabinFamily, checkIn, checkOut].forEach(element => {
  element.addEventListener('change', e => {
    if (people.value >= 1 && people.value <= 10) {
      let totalCostNumber = 0;
      const totalDays = moment(checkOut.value).diff(moment(checkIn.value), 'days');
      switch (document.querySelector('input[name="cabinType"]:checked').value) {
        case '0':
          totalCostNumber = 1200 * totalDays;
          break;
        case '1':
          totalCostNumber = 1700 * totalDays;
          break;
        case '2':
          totalCostNumber = 2500 * totalDays;
          break;
        default:
          break;
      }
      totalCost.innerHTML = numberWithCommas(totalCostNumber);
      stepThree.classList.add('isVisible');
      window.scrollTo({top: stepThree.offsetTop, behavior: 'smooth'});
    }
  });
})