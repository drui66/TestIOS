//
//  CustomJSONResponseSerializer.m
//  TestApp
//
//  Created by 邓竺芮 on 2024/4/25.
//

#import "CustomJSONResponseSerializer.h"

@implementation CustomJSONResponseSerializer

- (instancetype)init {
    self = [super init];
    if (self) {
        // 指定接受的内容类型为 "application/json" 和 "text/plain"
        self.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/plain", nil];
    }
    return self;
}

- (id)responseObjectForResponse:(NSURLResponse *)response data:(NSData *)data error:(NSError *__autoreleasing *)error {
    NSString *contentType = [response MIMEType];
    if ([contentType isEqualToString:@"application/json"]) {
        // 如果内容类型为 "application/json"，直接使用父类方法解析为 JSON 格式
        return [super responseObjectForResponse:response data:data error:error];
    } else if ([contentType isEqualToString:@"text/plain"]) {
        // 如果内容类型为 "text/plain"，将内容转换为 JSON 格式
        NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        NSDictionary *jsonObject = [self convertPlainTextToJSON:responseString];
        return jsonObject;
    } else {
        // 其他类型的内容，直接返回错误
        if (error) {
            *error = [NSError errorWithDomain:AFURLRequestSerializationErrorDomain code:NSURLErrorCannotDecodeContentData userInfo:nil];
        }
        return nil;
    }
}

- (NSDictionary *)convertPlainTextToJSON:(NSString *)plainText {
    // 在这里实现将 text/plain 格式的内容转换为 JSON 格式的方法
    // 这里只是一个示例，具体的转换方法取决于服务器返回的内容和你的需求
    NSData *jsonData = [plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSError *error;
    NSDictionary *jsonObject = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    if (error) {
        NSLog(@"Error parsing plain text to JSON: %@", error);
        return nil;
    }
    return jsonObject;
}

@end
