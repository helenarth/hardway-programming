doubleMe x = x + x
doubleUs x y = doubleMe x + doubleMe y
doubleUsOld x y = x*2 + y*2
doubleUsS x y = (succ x*2) + (succ y*2)
doubleSmallNum x = if x > 100
                     then x
                     else x*2
doubleSmallNum' x = (if x > 100 then x else x*2) + 1

-- definition
iAndMyBoobz = "I love my boobies."

-- fried chicken
defMoe x y z = succ x * ((succ x * succ y * succ z) + y*z)

-- list function
defMoe' x y = (if x > 100 then x:x:[x,y+y] else x:[x]++[y])


