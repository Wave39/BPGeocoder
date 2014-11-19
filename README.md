BPGeocoder
==========

Hey, you got your CLGeocoder in my NSCache... Hey, you got your NSCache in my CLGeocoder...

Two great tastes that taste great together. That is the theory behind BPGeocoder. After all, why doesn't it automatically
cache your CLGeocoder requests?

BPGeocoder is a drop-in replacement that you can use just like CLGeocoder, but with the benefit that additional requests
to geocode the same address will not hit the Apple servers repeatedly.

How it works
------------

It is quite simple, actually. BPGeocoder inherits from CLGeocoder, and initializes a global NSCache when first fired up.
Then, any address geocode requests to BPGeocoder first checks to see if the address string exists in the cache, and if so,
returns the cached results to the completion block. Otherwise, the request is sent to Apple as normal with CLGeocoder, 
again sending the results to the specified completion block.

How to use it
-------------

Just add the BPGeocoder.h and BPGeocoder.m file to your project, and then include the header file whenever you need to use it.

