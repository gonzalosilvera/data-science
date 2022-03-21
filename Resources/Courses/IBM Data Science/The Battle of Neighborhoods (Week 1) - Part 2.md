# The Battle of Neighborhoods

### Data

The data used for this project will be the following:

Uruguay postal codes and neighborhoods
In the national postal administration website, there's a csv file with cities, neighborhood and postal codes from Uruguay.
https://www.correo.com.uy/IsisBusquedaDireccionPlugin/localidades.jsp

Montevideo population and demographics information
There's general information in Montevideo wikipedia page.
https://en.wikipedia.org/wiki/Montevideo

Montevideo neighborhood coordinates
The nonimatim geopy module will be used together with the data retrieved from the email page to obtain the coordinates of latitude and longitude of each postal code.
https://geopy.readthedocs.io/en/stable/#nominatim

Montevideo venues
The foursquare api will be used to search for farmers markets, convenience stores, supermarkets and shopping malls in Montevideo.
https://developer.foursquare.com/docs/places-api/