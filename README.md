# README

#### Prerequisites

 * Rails 5.2.0
 * ruby 2.4.1p111 (2017-03-22 revision 58053) [x86_64-linux]
 * Sqilte3 3.16.2
 * Ubuntu 17.10(artful)(Used as development machine)

#### Considerations

1. Location will be available as in form of point in 2-d. e.g. (x,y)
2. Distance between two points(cab/customer) will be calculated via pythagoras theorem as mentioned in requirement spec.

#### API-Requests (Token needs to be change.)

API requests requires an HTTP Token authentication. Authentication Token will be available to Customer as a `token`
 attribute. 



###### To Start a journey(Book a Cab)
```CURL
curl --request POST \
  --url http://localhost:3000/journeys/book.json \
  --header 'authorization: Token token=XdBEv4DFu2xnWZ48xLudd8bz' \
  --header 'content-type: application/json' \
  --data '{
	"journey": {
		"x" : 45,
		"y" : 78
	}
}'
```
###### To close a journey

```CURL
curl --request PATCH \
  --url http://localhost:3000/journeys/1/complete.json \
  --header 'authorization: Token token=XdBEv4DFu2xnWZ48xLudd8bz' \
  --header 'content-type: application/json' \
  --data '{
	"journey": {
		"x" : 63,
		"y" : 24
	}
}'
```

