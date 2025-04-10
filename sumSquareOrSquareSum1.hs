sumSquareOrSquareSum x y = let sumSquare = x^2 + y^2  -- let表达式
                               squareSum = (x + y)^2
                           in --函数体开始
                            -- if要一个空格
                            if sumSquare > squareSum  --let表达式
                            then sumSquare
                            else squareSum

overwrite x = let x = 2
              in
                let x = 3
                in
                  let x = 4
                  in
                    let x = 5
                    in
                      x
-- 变量覆盖
