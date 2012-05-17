---
title: Learning Javascript
layout: default
---

This is a great place to start learning Javascript:

https://developer.mozilla.org/en-US/learn/javascript

And I think you'll find coffeescript pretty straight forward:

http://coffeescript.org/

Coffeescript encourages an uncommon, but very powerful style of programming.  It's called Functional Programming.  You'll find a lot of academic definitions for FP, but basically it gives you really powerful tools for dealing with collections of things and maps of things (key-value pairs).

There's a key distinction between imperative programming (the dominant paradigm) and FP.  In imperative programming you construct programs as a sort of to-do list.  Do this, then do this, then do this.  You are describing how it should be done, what steps should be taken to do something.  So a function in imperative programming is often thought of as a 'routine'.  You give it a name so you can perform it repeatedly.

In FP, you describe the program differently.  A function in FP is more true to what you learned in algebra class.  Remember f(x)?  This says `f` is a function of `x`.  That is, the output of the function `f` varies according to the input that you give it, `x`.  So, for this function:

f(x) = x+1

You could throw it 1 and it will return 2.  5 and it will return 6.  You can graph that:

http://www.wolframalpha.com/input/?i=f%28x%29+%3D+x%2B1

And once you define the function, it never changes.  Its output is completely predictable for a given input.  It's testable, provable, verifiable.  The more you can manage to define your application in these terms, the less unpredictable behavior and unthinkable complexity you will have in your app.  And when your functions have no side effects, it is trivial to run them in parallel.

Most programmers don't know this.  It's just beginning to catch on.  But it will be big.  It's the only way to write applications that can scale to the immense traffic that the web is capable of handing you.

You may not need to know these things to be a front end developer.  But why not?  It will make you a better programmer, and probably change the way you look at many things.
