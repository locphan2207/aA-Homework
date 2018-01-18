console.log('Hello from the JavaScript console!');

// Your AJAX request here
$.ajax({
  type: 'GET',
  url: 'http:/api.openweathermap.org/data/2.5/weather?q=New+York&appid=c8a076e6676bbb38a2ac8046da15fae2',
  success(weather) {
    console.log('Got Newyork weather!');
    console.log(weather);
  },
  error() {
    console.error('An error occurred.');
  },
});

// Add another console log here, outside your AJAX request
console.log('IDK?');
