---
title: Leibniz Fractal
layout: default
---

So you may be wondering what those rotating circles at the top of the page represent.  They come from a thought experiment proposed by the philosopher Gottfried Leibniz in the 17th century:

> Leibniz told to his friend and correspondent Des Bosses to imagine a circle, then to inscribe within it three congruent circles with maximum radius; the latter smaller circles could be filled with three even smaller circles by the same procedure. This process can be continued infinitely, from which arises a good idea of self-similarity.

If you search google for `Leibniz circle packing` you'll come up with a similar picture:

http://en.wikipedia.org/wiki/File:Apollonian_gasket.svg

This is the 'Apollonian gasket', or 'Leibniz Packing'. Packing the space between the circles is a more complex problem though, and is not as interesting to animate, so I decided to stick with a simple recursive circle filling algorithm.  The graphic is drawn and animated with Paper.js, and while I'm not completely satisfied with the performance, I suppose it'll do for now.  :-)

So why should we care about Leibniz?  Well, recently I've been talking with the @wearefractal team about using Monads to pull certain side effects out of application space.  The idea is that this would reduce complexity and make it easier to ensure the consistency of the application's state over time.  So we've been trying to wrap our heads around Monads.

Leibniz is a pretty interesting guy, because (among many other things) he layed the groundwork for the philosophy of Monads.  In philosophy, a Monad is an actor, a mover, a causer.  It transforms particles - the state of the universe - by means of a set of laws or principles.  So life is a sort of Monad.  The laws of physics can be described in terms of Monads.  God, the fundamental mover, is a Monad.

Well, that's cool, it sounds like being able to model these things in software would afford us a lot of descriptive power.  But how do you get from such an abstract concept to a concrete implimentation?  Fortunately for us, math provides a bridge - Category Theory.  Now Category Theory seems to me like good reading material for an acid trip.  But the key concept that I get is that we can extract common behaviors from similar Types into a Category.  This is sort of like inheritance in an object oriented paradigm, but it works quite differently.  Instead of having a strictly enforced format for the data, you work through defining transformations.  The transformations that you provide must adhere to a monadic contract, which ensures that the data maintains a consistent Type.
