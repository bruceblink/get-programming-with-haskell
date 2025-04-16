--cup f10z = \_ -> f10z

cup flOz = \message -> message flOz -- 添加命名参数的cup"构造函数"

getOz aCup = aCup (\f10z -> f10z)  --添加对象访问器(成员函数)

-- drink message 更新cup的状态
drink aCup ozDrank = cup (f10z - ozDrank)  -- drink message 更新cup的状态
  where f10z = getOz aCup  -- 获取对象原先的状态

