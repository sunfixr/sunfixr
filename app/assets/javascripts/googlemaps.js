var googleMapsInitialize = function() {
    geocoder = new google.maps.Geocoder();
    if (projectPosition) {
        var mapOptions = {
            zoom: 8,
            center: projectPosition
        }
        map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        var marker = new google.maps.Marker({
            position: projectPosition,
            map: map,
            title: projectName
        });
    } else {
        var closest_address;
        if (zip) {
            closest_address = zip;
        } else if (city) {
            closest_address = city;
        } else {
            closest_address = country;
        };
        googleMapsCodeAddress(closest_address);
    };
};

var googleMapsCodeAddress = function(mapLocation) {
    geocoder.geocode( { 'address': mapLocation}, function(results, status) {
        // alert(closest_address);
        if (status == google.maps.GeocoderStatus.OK) {
            var mapOptions = {
                zoom: 5,
                center: new google.maps.LatLng(results[0].geometry.location.lat(), results[0].geometry.location.lng())
            }
            map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        }
    });
}


