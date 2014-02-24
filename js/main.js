var myApp = myApp || {}

function initialise() {
  var mapOptions = {
    center: new google.maps.LatLng(51.5, -0.1),
    zoom: 14,
    streetViewControl: false,
    mapTypeControl: false,
    styles: [{"stylers":[{"visibility":"on"},{"saturation":-100}]},{"featureType":"water","stylers":[{"visibility":"on"},{"saturation":100},{"hue":"#00ffe6"}]},{"featureType":"road","elementType":"geometry","stylers":[{"saturation":100},{"hue":"#00ffcc"}]},{"featureType":"poi","stylers":[{"visibility":"off"}]},{"featureType":"poi.park","stylers":[{"visibility":"on"}]}]
  };
  myApp.map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
  addMarker();
}

// var loc_array = [];
// var loc_array = $('address').each(function(i, el){
// });
// (loc_array[0]).id

function addMarker() {
  console.log("Showing marker from geocoder results");

  var geocoder = new google.maps.Geocoder();

  var showMarkerFromGeocoderResults = function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      // var iconBase = '../images/';
      var marker = new google.maps.Marker({
        position: results[0].geometry.location,
        map: myApp.map,
        icon: 'http://www.nico-castro-files.com/current_loc.svg'
      });
    } else {
      console.warn("Couldn't geocode address.");
    }
  };

  $('address').each(function(i, el){
    var geocoderOptions = { address: $(el).text() };

    geocoder.geocode(geocoderOptions, showMarkerFromGeocoderResults);

  });
}

// function addMarker(map) {
//   var position = new google.maps.LatLng(51.522, -0.10959);
//   var marker = new google.maps.Marker({
//     position: position,
//     map: map,
//     title: "GA London"
//   });
//   map.setCenter(position);
// }

google.maps.event.addDomListener(window, 'load', initialise);








