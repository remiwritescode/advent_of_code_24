# Rule Processing

### Thoughts

This seems like it might be a good candidate for a recursive approach, the workflow I think applies here is that we need to have a bunch of rules, and narrow them down to only those that apply for the current print job.

From there, we need to determine the valid first page from the rules that apply to the print job. This seems like it can be done by finding the page number that ONLY has before-print rules, as the instructions suggest.

If that page can be found, then we discard all rules that applied to that page and repeat the process for the next page.

I _suspect_ part 2 will require correcting the invalid print jobs, so for the time being I think the approach of generating the corrected ruleset if possible and then comparing versus the provided ruleset will be the flexible approach. But first, let's take the example and see if that can be ordered in a way that satisfies all the rules...

47|53
97|13
97|61
97|47
75|29
61|13
75|53
29|13
97|29
53|29
61|53
97|53
61|29
47|13
75|47
97|75
47|61
75|61
47|29
75|13
53|13

61,13,29

Rules that apply:

61|29
61|13
29|13

A corrected order that is generated:

61, 29, 13

This seems like it *might* be a valid approach. Probably worth returning a nil or something if a valid ruleset can't be generated.

A rule is valid if both of its numbers are in the set.

How do I represent these concepts and what is the domain responsibility of each?

I feel like there's definitely the concept of a PrintJob, that takes the pages and the rules that apply to it. It seems like the PrintJob should be able to return the corrected page order (or maybe nil if it's truly impossible) as well as (for part 1) an initial_order_valid? as well as the page_midpoint that returns the middle page of the corrected set. Rules don't seem complex enough to warrant behavior, can probably just make a Struct or tuple or something.

#### Steps for determining if a first page is valid?

Conceptually it's the page that never appears in the second column. If I know all rules apply, indexing by the second page and then taking the number that does not appear as a key in the resulting hash as the value seems like it might work. There's an element of not being sure if its possible that a page has NO applicable rules which could cause a nondeterministic ordering there.
