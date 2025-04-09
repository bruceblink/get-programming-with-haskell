sumSquareOrSquareSum x y = if x^2 + y^2 > (x + y)^2
                            then x^2 + y^2
                            else (x + y)^2
