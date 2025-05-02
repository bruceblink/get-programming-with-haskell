module Lesson11 where
half :: Int -> Double
half n = (fromIntegral n) / 2

-- 定义多参数函数
makeAddress :: Int -> String -> String -> (Int, String, String)
makeAddress number street town = (number, street, town)

makeAddressLambda = (\number ->
                        (\street -> 
                            (\town -> (number, street, town))))

ifEven :: (Int -> Int) -> Int -> Int 
ifEven f n = if even n 
             then f n 
             else n




