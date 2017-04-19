#SQL--将 .sql 文件 写入数据库

> 可爱的后台乐哥给我一份.sql 文件，里面是sql 语句，意思是叫我将.sql文件运行，添加到数据库中。就比较方便，有方法可以直接运行.sql 文件，iOS 方面，我目前没有找到可以直接调用.sql 文件的方法，所以使用了以下这种方式进行写入数据库。

后台给我的内容是这样的：

	
	/* app参数表 存放全局属性*/
	CREATE TABLE IF NOT EXISTS APP_PARAMETER(
	   PARAMETER_KEY     VARCHAR(50)   NOT NULL,   /* 参数键 */
	   PARAMETER_VALUE   VARCHAR(150)  NOT NULL,   /* 参数值 */
	   PARAMETER_EXPLAIN VARCHAR(150),             /* 参数说明 */
	   PRIMARY KEY (PARAMETER_KEY)
	);
	
	/* 出租类型表 */
	CREATE TABLE IF NOT EXISTS RENT_TYPE(
	   RENT_TYPE_ID    TINYINT(1)  NOT NULL,  /* 出租类型id */
	   RENT_TYPE_NAME  VARCHAR(10) NOT NULL,  /* 出租类型名称 */
	   PRIMARY KEY (RENT_TYPE_ID)
	);
	
	DELETE FROM APP_PARAMETER;
	DELETE FROM RENT_TYPE;
	
	INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('FACTORY_MAX_PAGE',           '5',            '最大图片显示张数');
	INSERT INTO APP_PARAMETER (PARAMETER_KEY,PARAMETER_VALUE,PARAMETER_EXPLAIN) VALUES ('FACILITIES_MAX_NUM',         '4',            '配套设施最大数');


###具体步骤：

1、 将文件放到 Bundle 中，获取文件路径。


2、通过编码转换，将文件中的内容转换成 NSString 类型，这时候你就可以拿到对应的 内容，如果装换不成功，请转换编码格式。

3、在沙盒中 创建数据库。

4、通过 `componentsSeparatedByString:` 方法将String 中的内容进行分割，（每一句SQL语句后面都是用分隔号分割的，故使用`componentsSeparatedByString:`进行分割）。

5、将SQL语句使用 FMDB 写入数据库中。

###例子：

```
	NSString *filePath = [[NSBundle mainBundle ] pathForResource:@"app_database.sql" ofType:nil];
	
    NSError *error;
    
    
    NSString *textFileContents = [NSString stringWithContentsOfFile:filePath encoding:CFStringConvertEncodingToNSStringEncoding(kCFStringEncodingGB_18030_2000) error: & error];
    
    NSLog(@"%@",error);

    NSString *sqlPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject] stringByAppendingPathComponent:@"app_database.db"];
    
    NSArray *array = [textFileContents componentsSeparatedByString:@";"];
    
    NSLog(@"%@",array);
    
    NSLog(@"%@",sqlPath);
    
    
    
    FMDatabase *db = [FMDatabase databaseWithPath:sqlPath];
    
    if ([db open]) {
        
        for (NSString *str in array) {
            BOOL res = [db executeUpdate:str];
            
            if (!res) {
                NSLog(@"error when creating db table");
            } else {
                NSLog(@"成功了");
            }
        }
        
    }
```



