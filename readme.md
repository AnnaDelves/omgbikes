# Our Bike Containers

## DockingStation / Van / Garage

### Methods
`#release_a_bike`

`#return_a_bike`

`#collect_bikes`

`#unload`

`#docked_bikes`

`#capacity`

`#bike_location_type`

`#broken_bike_bay`

`#working_bike_bay`

`#stored_bikes`

What core methods does every bike container need?

Can we use existing common methods to make our specific methods simpler / easier?

What about error messages?

What is a module? Will that help?

#To Do (for tests)
- Get rid of unknown subjects
  e.g. subject = bike
  expect(bike) instead of expect(subject)
- Change all the instance variables into let
- Put tests into blocks and move logic to the start if it's more appropriate there
  e.g. before each 'something that happens at the start of all the tests in this block'
- What will a van do if the garage is full/empty??
- Shared examples for bike container is the place to start to work out how other tests should look
