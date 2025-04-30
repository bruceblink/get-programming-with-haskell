-- 让我们看看如何创建你想要用于读取和写入图像的基本功能。以下是程序的基本结构：
-- 1. 从用户那里获取文件名参数。
-- 2. 读取图像文件的二进制数据。
-- 3. 随机更改图像数据中的字节。
-- 4. 写入包含故障图像的新文件。

import System.Environment
import qualified Data.ByteString as B
import qualified Data.ByteString.Char8 as BC

main :: IO ()
main = do
  args <- getArgs
  let fileName = head args
  imageFile <- BC.readFile fileName
  glitched <- return imageFile
  let glitchedFileName = mconcat ["glitched_",fileName]
  BC.writeFile glitchedFileName glitched
  print "all done"