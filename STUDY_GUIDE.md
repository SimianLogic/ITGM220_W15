#Intro Game Programming Study Guide

## Example Questions / Answers:

Q: What is a variable?

A: A variable is a named thing that can hold a value of a specific type. Whenever you type that name later, you get back that value. In the reference below we're storing the value 7 in the variable named "x".

Example: https://github.com/SimianLogic/ITGM220_W15/blob/master/00_practice/processing/sketch_02/sketch_02.pde

Line: 1

Q: What is the difference between a primitive and an object?

A: A primitive is a built-in data type like int or boolean. An object is a custom class made up of variables and functions. Most primitives can be assigned in-line, but with variables you have to use the "new" keyword.

Primitive Example: https://github.com/SimianLogic/ITGM220_W15/blob/master/00_practice/processing/sketch_02/sketch_02.pde

Line: 1

Object Example: https://github.com/SimianLogic/ITGM220_W15/blob/master/00_practice/processing/sketch_25/sketch_25.pde

Line: 2 (declared) and 11 (instantiated)


## Required for Final Project
1. What's the difference between a class variable and a local variable?
1. What is an array? How do you declare an array of ints?
1. What does immutable mean? 
1. What does mutable mean?
1. Name one immutable data type in Processing/Flash/Unity.
1. Name one mutable data type in Processing/Flash/Unity.
1. Give an example of why would you use one and not the other.
1. What is a function?
1. What's the difference between a void function and a non-void function?
1. What is a function parameter?
1. What does the "return" keyword do in a non-void function?
1. What is a conditional?
1. What does "else" mean?
1. What order should "if", "else if", and "else" appear? Why?
1. What are the logical AND and logical OR operators? What do they do?
1. What is the NOT operator and what does it mean?
1. How many parts does a for-loop have? What does each part mean?
1. What is a class?
1. How do you create an instance of a class?
1. Give an example of a built-in Processing/Flash/Unity class. List 1 variable and 1 function on that class.
1. What is a constructor?

## Optional for Final Project (but required for study guide)
1. What is a nested for-loop?
1. What is a for-each loop? Why would you use for-each instead of a regular for-loop?
1. What is a switch statement?
1. What does the "break" keyword mean?
1. What does the "return" keyword do in a void function? 
1. What is a subclass? 
1. What does "super" mean?
1. What is a static variable?


## Overall Grading Guidelines for Final Project
1. Must have at least 3 screens (typically Menu/Splash, Gameplay, and Game Over)
2. Must have a written design/description of the game. (It's an endless runner with procedurally placed platforms and double-jumping).
3. The "rules" of the game must be consistent with your design (i.e. if you were doing Towers of Hanoi you'd have to make it so you can't put down big discs on small discs).

## Checklist for Final Project
1. Use at least 1 local variable and one class variable.
1. Use at least 1 mutable container class.
1. Use at least 1 immutable container class.
1. Write at least 1 void function.
1. Write at least 1 non-void function.
1. One of your functions must take a parameter.
1. Write at least one conditional statement.
1. Use at least 1 logical operator -- AND, OR, NOT
1. Use at least 1 for loop.
1. Write at least 1 custom class with a constructor.
1. Create at least 1 instance of your class.
1. Make use of at least 1 built-in class (stored in a variable, instantiated).
1. You must load at least 1 image and display it on screen (but more is better! Polish helps).
1. You must render dynamic text on screen (like a high score or turn counter).
1. You must be able to "play" indefinitely without stopping/starting the game (a New Game button that actually starts a new game)

## "Polish" Elements for Final Project
These are examples of things that can be done to elevate your project into A territory.
1. Add sound effects.
2. Add animated elements (think code-animation, not sprite sheets) -- do buttons "move" or "squish" when you click on them? Do elements fade or transition in or just pop into place? 
3. Add some sort of high score persistence. Can I replay to get a better high score?
4. Art it up! Make it look super cool (note that this doesn't require any programming skill, so if you're struggling with the code just make somethign simple and polish the heck out of it)
5. Add extra screens. Maybe you have a start screen that leads into a level select screen.


