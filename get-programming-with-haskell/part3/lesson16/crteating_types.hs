module Lesson16 where
import Data.Monoid (Last)

-- C语言中的积类型
{- struct author_name {
	char *first_name;
	char *last_name;
};

struct book {
	author_name author;
	char *isbn;
	char *title;
	int year_published;
	double price;
}; -}

-- C中的struct转换到Haskell中
-- data AuthorName = AuthorName String String
-- data Book = Author String String Int

-- 使用record语法展示与C结构体的相似性
{- data Book = Book {
    author :: AuthorName ,
    isbn   :: String,
    title  :: String,
    year   :: String,
    price  :: Double
} -}

data AuthorName = AuthorName {
    first_name :: String,
    last_name  :: String
}

-- 使用Java定义Book类

{- public class Book {
    Author author;
    String isbn;String title;
    int yearPublished;
    double price;
} -}

-- 定义 黑胶唱片（VinylRecord）
{- public class VinylRecord {
    String artist;
    String title;
    int yearPublished;
    double price;
} -}
-- 给Book和VinyRecord创建超类
{- public class StoreItem {
    String title;
    int yearPublished;
    double price;
}
public class Book extends StoreItem{
    Author author;
    String isbn;
}
public class VinylRecord extends StoreItem{
    String artist;
} -}

-- 玩具模型
{- public class CollectibleToy {
    String name;
    String description;
    double price;
} -}

-- 通用的和类型
data Bool = False | True

-- 使用和类型给名称建模
type FirstName = String
type LastName = String
type MiddleName = String

{- data Name = Name FirstName LastName
          | NameWithMiddle FirstName MiddleName LastName -}

-- 一个 `Creator` 类型，它可以是 `Author` 也可以是 `Artist`。
data Creator = AuthorCreator Author | ArtistCreator Artist
data Author = Author Name
data Artist = Person Name | Band String

-- 出现单字符H.P. Lovecraft这种的
data Name = Name FirstName LastName
    | NameWithMiddle FirstName MiddleName LastName 
    | TwoInitialsWithLast Char Char LastName

-- H.P. Lovecraft
hpLovecraft :: Creator 
hpLovecraft = AuthorCreator 
                (Author
                    (TwoInitialsWithLast 'H' 'P' "Lovecraft"))
-- 

-----  整合 bookstore

data Book = Book {
    author :: Creator , 
    isbn :: String , 
    bookTitle :: String , 
    bookYear :: Int , 
    bookPrice :: Double 
}

-- 定义 VinylRecord类型
data VinylRecord = VinylRecord {
    artist :: Creator , 
    recordTitle :: String , 
    recordYear :: Int , 
    recordPrice :: Double 
}

-- 定义 StoreItem
-- data StoreItem = BookItem Book | RecordItem VinylRecord

-- 定义 CollectibleToy
data CollectibleToy = CollectibleToy {
    name :: String, 
    descrption :: String , 
    toyPrice :: Double 
}
-- 添加 CollectibleToy
data StoreItem = BookItem Book
    | RecordItem VinylRecord
    | ToyItem CollectibleToy


-- 一个使用带有价格函数的 StoreItem 类型的示例：
price :: StoreItem -> Double 
price (BookItem book) = bookPrice book 
price (RecordItem record) = recordPrice record 
price (ToyItem toy) = toyPrice toy

