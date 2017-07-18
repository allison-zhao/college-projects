#Allison Zhao, Section 3, Assignment 11 (Extra Credit)

import turtle
import random
import math

turtle.speed(10)


turtle.title("Allison Zhao's Turtle Animation")

turtle.setup(1000,1000,0,0)

# drawSquare function
# input: go to a position (x,y)
#         input 4 sides
#         input the directions
# processing: renders a square based on the supplied input
# output: returns nothing to the calling program

def drawSquare (ttl, x, y, side):
    ttl.penup()
    ttl.goto(x, y)
    ttl.setheading(0)
    ttl.pendown()
    for iter in range (4):
        ttl.forward(side)
        ttl.right(90)
    ttl.penup()

# polygon function
# input:  accepts two integers
#         sides - defines how many sides we need to draw
#         length - defines the length of each side
# processing: renders a polygon based on the supplied input
# output: returns nothing to the calling program

def polygon(sides, length):
    for x in range(sides):
        turtle.forward(length)
        turtle.right(360/sides)

# background function
# input:  fill the color purple
#         use the drawsqaure function to load up the canvas
# processing: renders the whole canvas based on the supplied input
# output: returns nothing to the calling program
def background(usercolor):
    ttl = turtle.Turtle()
    ttl.fillcolor(str(usercolor))
    ttl.begin_fill()
    drawSquare(ttl,-500,500,1000)
    ttl.end_fill()
    

# tree() function
# input: x and y coordinates (integers)of both top and bottom of the trees
#        fill the up with green and bottom with brown color
#        uses the drawSqaure function for bottom of the tree
#        uses circle for top of the tree
# processing: draws a tree at the x, y coordinates specified
# output: returns nothing to the caller

def tree():
    #draw bottom
    ttl = turtle.Turtle()
    ttl.fillcolor('brown')
    ttl.begin_fill()
    drawSquare(ttl,-200,0,50)
    drawSquare(ttl,-50,0,50)
    ttl.end_fill()

    #draw top
    turtle.penup()
    turtle.goto(-175,0)
    turtle.pendown()
    turtle.begin_fill()
    turtle.color('green')
    turtle.circle(60)
    turtle.end_fill()
    turtle.penup()
    turtle.goto(-25,0)
    turtle.pendown()
    turtle.begin_fill()
    turtle.color('green')
    turtle.circle(60)
    turtle.end_fill()
    turtle.hideturtle()

# pool function
# input:  go to a position (x,y)
#         fill with the color blue
#         uses the polygon function
# processing: renders a square pool based on the supplied input
# output: returns nothing to the calling program

def pool(poolsize):
    turtle.penup()
    turtle.goto(-175,-100)
    turtle.pendown()
    turtle.begin_fill()
    turtle.color('blue')
    polygon(4,poolsize)
    turtle.end_fill()

# clouds function
# input:  give a range of positions
#         draw a series of circles
#         fill circles with white color
# processing: renders a series of white circles based on the supplied input
# output: returns nothing to the calling program

def clouds(clouddist,cloudsize):
    for x in range(-200,60,clouddist):
        turtle.penup()
        turtle.goto(x,200)
        turtle.pendown()
        turtle.begin_fill()
        turtle.color('white')
        turtle.circle(cloudsize)
        turtle.end_fill()

# flowers function
# input:  go to a random position
#         input a small triangle
#         fill it with the pink color
# processing: renders random pink triangles based on the supplied input
# output: returns nothing to the calling program

def flowers(numofflowers):
    for x in range(0,numofflowers):
        xpos = random.randint(0,200)
        ypos = random.randint(-200,0)
        turtle.penup()
        turtle.goto(xpos,ypos)
        turtle.pendown()
        turtle.begin_fill()
        turtle.color('pink')
        polygon(3,10)
        turtle.end_fill()

# drawArcR function
# input: draw the arcs of the sun (right)
# processing: renders arcs (right) based on the supplied input
# output: returns nothing to the calling program
def drawArcR (ttl, size, degrees):
    for iter in range (degrees):
        ttl.forward (size)
        ttl.right (1)

# drawArcL function
# input: draw the arcs of the sun (left)
# processing: renders arcs (left) based on the supplied input
# output: returns nothing to the calling program
def drawArcL (ttl, size, degrees):
    for iter in range (degrees):
        ttl.forward (size)
        ttl.left (1)

# drawRay function
# input: draw the rays of the sun 
# processing: renders sun rays based on the supplied input
# output: returns nothing to the calling program
def drawRay (ttl, size):
    for iter in range (2):
        drawArcR (ttl, size, 90)
        drawArcL (ttl, size, 90)

        
# drawSun function
# input: draw the arcs and rays of the sun 
# processing: renders a sun based on the supplied input
# output: returns nothing to the calling program
def drawSun (ttl, size, color):
    ttl.fillcolor (color)
    ttl.begin_fill ()
    for iter in range (9):
        drawRay (ttl, size)
        ttl.right (160)
    ttl.end_fill ()

# Sun function
# input: go to a position
#        use drawSun function to draw a yellow sun
# processing: renders a yellow sun based on the supplied input
# output: returns nothing to the calling program
def sun():
    ttl = turtle.Turtle()
    ttl.speed(10)
    ttl.penup()
    ttl.goto(250,250)
    ttl.pendown()
    drawSun(ttl,1,'yellow')
    
    
usercolor=str(turtle.textinput("usercolor","What color would you like the background to be?"))
poolsize=int(turtle.textinput("poolsize","How big would you like the pool to be?"))
clouddist=int(turtle.textinput("clouddist","How close would you like the clouds to be?"))
cloudsize=int(turtle.textinput("cloudsize","How big would you like the clouds to be?"))
numofflowers=int(turtle.textinput("numofflowers","How many flowers would you like to have?"))



background(usercolor)
tree()
pool(poolsize)
clouds(clouddist,cloudsize)
flowers(numofflowers)
sun()

turtle.exitonclick()

