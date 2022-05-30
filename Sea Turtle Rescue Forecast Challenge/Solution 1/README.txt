Hi again,

I saw the post about the new rules. Aside from file locations, I don't expect there's any trouble running what I provided. Happy to update the locations of each (comment out the top, remove "Archive/" from the SS load, if that's helpful.

Where mine is clearly lacking is in documentation. For mine, it would be fairly trivial to add it, since it's under 60 lines total, including some diagnostics left in. I'll do so when I put it in a Github repo (which I intend to do), or I can add that today if you'd prefer. Going forward, that and a 48 hour timer could be difficult to achieve, but I'm comparing to Kaggle, and it might be good to emphasize that the goal of Zindi is more of doing public good and implementing solutions than merely achieving the top result. That's not a thorough opinion on my part, but I'm just mentally contrasting that with Kaggle which does not have as lofty goals as well-documented code turned in within 48 hours of their winners.

If there's a true issue with my submission, in particular combination with the documentation, it would be the unexplained last three lines. It's the same as the roads--using leaderboard feedback to guide the best submission. Here, I'll say I felt torn about using it at all. It isn't for money, it is to help sea turtles, and that kind of usage of feedback doesn't help real-life models. But it is part of the competition setup. When other teams moved up the leaderboard rapidly the last few days, I made the assumption it was being done otherwise. I could have tuned every single site; I can't well explain why those three were chosen, but I backed off of two less significant ones.

Some aspects that enable this strategy to work are:
* high number of submissions per day
* automatically choosing the top scoring submission
* inclusion of the public LB within the final score (Branden Murray's comment)
* stratification of public/private splits: the closer to random, the more probing will guide a good final solution; e.g. in this one for the main stratification choices would be time and site; I'm not sure which is stronger, but a quick look seemed that site characteristics changed year over year, and it seems site worked fairly well; i never tried anything else (time).

The response to Branden Murray's comment from the SANRL competition makes sense, but just be aware that it's a big factor in incentivizing such a solution.
Though this response is coming in quickly, I don't mean to "teach a lesson" or any such negative intentions. Thus, I won't expand on any of those points above, but would be happy to continue a discussion about these--I've had such discussions with Kaggle employees before. I'll also add that each of the factors above does help create a stable leaderboard and minimize "shake up" that can happen and dissuade competitors from trying again.

I've felt guilty about this strategy for a while. If I wanted to fully exploit it, I no doubt could have tuned every site and perhaps weeks, if that was part of it, using all 10/day to fit the test set very well. I did want to collect some Zindi points, but I didn't really mean to be first, or even in the top several. I assumed that, like the roads one, I'd drop a few places.

I'll also add that I tried quite a few ideas that would be more in keeping with what would benefit Local Ocean Conservation more--attempts at learning geographic factors, inferring site-specific nuances of seasonal fluctuations, learning when extrapolation might appear in the following year. I couldn't find any of those signals reliably, and thus what I have. I told my son that I felt bad for the turtles that I won.

Though I do feel guilty about it, I feel confident that it isn't cheating--I believe I fully complied with the rules, and the tactics are the same as the code sent in for the SANRL competition. It's the spirit of the task that is not well aligned here, not the spirit of competition. I rationalized it by presuming (admittedly, without data to back it) that others were doing so, either on purpose or accidentally.

If desired, I could work on using the Github README to illuminate the issue and point to other references on the matter, and so so with Zindi approval so that it doesn't send the wrong message. I find leakage on Kaggle and other places (AV, CAX) interesting because you can see how easy it is to use accidentally, if one focuses on the fact that real working data scientists rarely have curated leaderboards and crowdsourcing. We see professional data scientists leaking information to themselves all the time when we work with customers at H2O. This isn't leakage, but it's in the same cluster.

To wrap it up, I can say that in no other competition am I doing the same thing. I am having a good time diving into deep learning with the crop and bird competitions. Likely the Malawi competition has some similar elements, but I have not attempted to utilize such tactics and will not. I fear based on John's writeup of the birds that he might have used public xeno-canto data that people could discover, but I have not and will not try to find out (hope not).

I hope it's clear this is not meant to be confrontational at all. It is a combination of getting it out in the open (after the fact), and, in case this exposure wasn't well understood, it might be informative and inviting of further discussion if desired.

Mark
