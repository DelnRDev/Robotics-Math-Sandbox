# Deriving CFrame.lookAt

Given:

pointA

pointB

Forward:

f̂ = (pointB - pointA) / ||pointB - pointA||

Back:

b̂ = -f̂

World Up:

ŷ = (0,1,0)

Right:

r̂ = ŷ × b̂

Up:

û = b̂ × r̂

Construct frame:

R = [ r̂ û b̂ ]

Transform:

T =
[
R p
0 1
]