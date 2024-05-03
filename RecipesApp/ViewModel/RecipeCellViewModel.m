//
//  RecipeCellViewModel.m
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import "RecipeCellViewModel.h"

@implementation RecipeCellViewModel

- (void)downloadImage:(void (^)( UIImage * _Nullable image, NSError * _Nullable error))completion stringUrl:(NSString *)stringUrl{
    
    UIImage *img = [[ImageCacheManager sharedImageCache] getImage:stringUrl];
    if(img != nil){
        completion(img, nil);
        return;
    }
    
    NSURL *url = [NSURL URLWithString:stringUrl];
    if(url == nil){
        NSError *err = [[NSError alloc] initWithDomain:@"" code:NSURLErrorBadURL userInfo:@{}];
        completion(nil, err);
    }
    NSURLSession *session = [NSURLSession sharedSession];
    NSURLSessionDataTask *task = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(error != nil ){
            NSError *err = [[NSError alloc] initWithDomain:@"" code:NSURLErrorBadServerResponse userInfo:@{}];
            completion(nil, err);
        }
        
        if(data == nil){
            NSError *err = [[NSError alloc] initWithDomain:@"" code:NSURLErrorBadServerResponse userInfo:@{}];
            completion(nil, err);
        }
        
        UIImage *img = [UIImage imageWithData:data];
        if(img == nil){
            NSError *err = [[NSError alloc] initWithDomain:@"" code:NSURLErrorCannotDecodeRawData userInfo:@{}];
            completion(nil, err);
        }
        [[ImageCacheManager sharedImageCache] saveImage:img key:stringUrl];
        completion(img, nil);

    }];
    [task resume];
}

@end
