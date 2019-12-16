const slider = new VJSlider(document.querySelector('.carousel'), {});
const switchs = document.getElementsByClassName('cabin-switcher');

function switchSlider(index, onlyUpdate) {
  document.body.dataset.currentSlide = index;
  if (!onlyUpdate) {
    slider.slide(index);
  }
}

Array.from(switchs).forEach((element, index) => {
  element.addEventListener('click', e => {
    e.preventDefault();
    switchSlider(Number(element.dataset.slide), false);
  })
});
