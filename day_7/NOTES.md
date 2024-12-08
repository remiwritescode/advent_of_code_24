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

Well, it seems that passes the examples, but not everything else.

I tried to contrive an example that I think could drive out the failure I seem to be having. I believe it's an occurrence where multiplying the end term does not cause the value to go over, but multiplying an earlier term does. Or in this instance, where a value to the right of a multiply must be added.

How can I solve this?

I had thought that reducing the right most multiple might be a soution if the value is over following a multiplication. This *also* works, but I suspect all the test cases with my old logic would effectively do the same thing. 

I wonder if I just need to go back to brute forcing. Can I write code to generate all permutations for a brute force approach instead?

[]
[[ADD], [MULTIPLY]]
[[ADD, ADD], [ADD, MULTIPLY], [MULTIPLY, ADD], [MULTIPLY, MULTIPLY]]
