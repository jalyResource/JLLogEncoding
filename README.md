# JLLogEncoding
解决打印字典时，中文乱码问题。

## 1、 原理
> 参考文章  [iOS 解决打印字典时，中文乱码问题](http://www.jianshu.com/p/7f0edba7c317)

## 2、使用方法
#### 1、cocoapods 

    pod 'JLLogEncoding'
#### 2、手动添加文件
    将 JLLogEncoding 目录下的 NSArray NSDictionary 的扩展文件拖进工程即可
    
![pic](http://ouuzqdpag.bkt.clouddn.com/logEncoding_extension.png)
    
    
## 3、其它转码方式的缺点
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
通过以上方式，将 JSON 转为字符串，虽然可解决中文乱码问题，但当 NSDictionary 中包含普通对象时，无法将对象转成字符串，进而导致程序崩溃。


