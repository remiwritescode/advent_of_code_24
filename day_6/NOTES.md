# Path prediction

So, I need to generate the guards route along a grid, cycle through until the guard leaves the area, and then count the number of grid locations visited by the guard. Seems like it's time to create some kind of model for the space that can store a state of if the guard had been in the space.

I can think of two approaches immediately..
- Use OOP to map the space and place the guard at an initial starting point, modeling the guards step by step map and recording the spaces the guard has entered using references. Then maybe some kind of external record can increment every time the guard enters a new space, finishing the loop when the guard goes out of bounds.

- Model the space into a multimensional array of objects instead of building the relationship. Managing indices of the grid until the guards new position is out of bounds of the grid.

I think the second seems easier..

## Part 2

I went with kind of a brute force approach of just trying every possible obstacle position and catching when it would create an error. I also see an approach of tracking the guards position and checking for obstacles that are along the next orientation axis that would result in a bounce to a poisition that the guard has already passed. I think this approach would execute faster, but it was a small change to make this approach work and I think it would have net taken me longer to get the solution if I had to figure out how to look ahead than it did to make this small change and just wait for the slower brute force solution to try the 16,211 iterations.
