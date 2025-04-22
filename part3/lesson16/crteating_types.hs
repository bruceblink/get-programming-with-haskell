module Lesson16 where

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
data Book = Book {
    author :: AuthorName ,
    isbn   :: String,
    title  :: String,
    year   :: String,
    price  :: Double
}

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

