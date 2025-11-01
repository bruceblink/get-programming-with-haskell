# 怎么运行

## 编译运行

```bash
$ ghc Main.hs  # 编译
[1 of 2] Compiling Main             ( Main.hs, Main.o )
[2 of 2] Linking Main.exe [Objects changed]
$ ./Main  # 运行
```

## 直接运行

```bash
runhaskell Main.hs
```

## ghci加载运行

```bash
ghci
ghci> :load Main.hs 
[1 of 2] Compiling Main             ( Main.hs, interpreted )
Ok, one module loaded.
ghci> main
"Hello, Haskell!"
```
