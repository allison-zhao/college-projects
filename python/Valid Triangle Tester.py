#Allison Zhao, Section 3, 2/23/15, Assignment#3,Problem#1, Valid Triangle Tester

#Prompt the user to enter in 3 points on a standard Cartesian coordinate plane
print ("Valid Triangle Tester:")
print()
x1=float(input("Enter the x coordinate for point 1:"))
y1=float(input("Enter the y coordinate for point 1:"))
x2=float(input("Enter the x coordinate for point 2:"))
y2=float(input("Enter the y coordinate for point 2:"))
x3=float(input("Enter the x coordinate for point 3:"))
y3=float(input("Enter the y coordinate for point 3:"))
print()

#Calculate the length of each side of the triangle

side1=((x1-x2)**2+(y1-y2)**2)**(0.5)
side2=((x2-x3)**2+(y2-y3)**2)**(0.5)
side3=((x1-x3)**2+(y1-y3)**2)**(0.5)
side1f=format(side1,".2f")
side2f=format(side2,".2f")
side3f=format(side3,".2f")

#Report the distance to the user of each side, rounded to 2 decimal places
print("The length of each side of your test shape is:")
print()
print("Side 1:",side1f)
print()
print("Side 2:",side2f)
print()
print("Side 3:",side3f)
print()

#Determine if the three points could form a valid triangle
if side1+side2>side3 and side2+side3>side1 and side1+side3>side2:
    print("This is a valid triangle!")

else:
    print("This is not a valid traingle.")
