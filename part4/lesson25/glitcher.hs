-- 让我们看看如何创建你想要用于读取和写入图像的基本功能。以下是程序的基本结构：
-- 1. 从用户那里获取文件名参数。
-- 2. 读取图像文件的二进制数据。
-- 3. 随机更改图像数据中的字节。
-- 4. 写入包含故障图像的新文件。

import System.Environment
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC
import System.Random

main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  imageFile <- BC.readFile fileName
  glitched <- return imageFile
  let glitchedFileName = mconcat ["glitched_",fileName]
  BC.writeFile glitchedFileName glitched
  print "all done"

-- intToChar 从 Int 创建一个有效的字节
intToChar :: Int -> Char
intToChar int = toEnum safeInt
  where safeInt = int `mod` 255

-- intToBC 接受一个 Int 并返回一个单字符 ByteString
intToBC :: Int -> BC.ByteString
intToBC int = BC.pack [intToChar int]

-- replaceByte 删除一个字节并用一个新字节替换它
replaceByte :: Int -> Int -> BC.ByteString -> BC.ByteString
replaceByte loc charVal bytes = mconcat [before,newChar,after]
  where (before,rest) = BC.splitAt loc bytes
        after = BC.drop 1 rest
        newChar = intToBC charVal


-- randomReplaceByte 将随机数应用于 replaceByte

randomReplaceByte :: BC.ByteString -> IO BC.ByteString
randomReplaceByte bytes = do
  let bytesLength = BC.length bytes
  location <- randomRIO (1,bytesLength)
  charVal <- randomRIO (0,255)
  return (replaceByte location charVal bytes)