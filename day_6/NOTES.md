# Path prediction

So, I need to generate the guards route along a grid, cycle through until the guard leaves the area, and then count the number of grid locations visited by the guard. Seems like it's time to create some kind of model for the space that can store a state of if the guard had been in the space.

I can think of two approaches immediately..
- Use OOP to map the space and place the guard at an initial starting point, modeling the guards step by step map and recording the spaces the guard has entered using references. Then maybe some kind of external record can increment every time the guard enters a new space, finishing the loop when the guard goes out of bounds.

- Model the space into a multimensional array of objects instead of building the relationship. Managing indices of the grid until the guards new position is out of bounds of the grid.

I think the second seems easier..
