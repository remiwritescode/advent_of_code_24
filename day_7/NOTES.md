# Calibration

I can add or multiply the right terms based on their existing order, and all operations are evaluated left to right, regardless of precedence.

The goal is to figure out if a valid calibration (totalling the provided calibration target) exists for the numbers using only addition and multiplication.

## How do I think I can solve this?

Well, there's the brute force method of attempting all permutations of addition and multiplication to see if a valid term exists. 

Let's try solving some manually...

190: 10 19

As a human I can see it's obviously a multiple, but for the sake of the problem, let's try a more reasoned approach.

Summing yields 29, which is too low.
Multiplying yields the correct answer.

Okay cool, its easy to try the swap on two terms, but adding more gets more complicated...

Let's try the given valid answer that seems more reasonably complicated:

292: 11 6 16 20

11+6+16+20 = 53
11+6+16*20 = 660 (Too high), note this tells me we can NEVER multiply the last value. I wonder if we can work that into this somehow
11+6*16+20 = 292 (Valid)

Okay, so, starting with all addition, then walking left and swapping to multiples, undoing them when it exceeds the value seems like it might be a possible solution?
