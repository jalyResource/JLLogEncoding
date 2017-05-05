# JLLogEncoding
解决打印字典时，中文乱码问题。

##1、 原理参考文章  [iOS 解决打印字典时，中文乱码问题](http://www.jianshu.com/p/7f0edba7c317)

##2、使用方法
    >将extension目录下的NSArray NSDictionary的扩展文件拖进工程即可
    
    
    
##3、使用以下方法时，字典数据结构不对会引发崩溃
```
- (NSString *)getUTF8String {
    if ([self isKindOfClass:[NSDictionary class]] == NO) {
        return @"";
    }
    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject:self options:NSJSONWritingPrettyPrinted error:&error];
    if (error) {
        return @"";
    }
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    return str;
}
```

