//
//  ImageCacheManager.m
//  RecipesApp
//
//  Created by Ariel Ortiz on 5/1/24.
//

#import "ImageCacheManager.h"

@interface ImageCacheManager ()

@property(strong, nonatomic) NSCache<NSString *, UIImage *> *cache;

@end

@implementation ImageCacheManager

+ (id)sharedImageCache {
    static ImageCacheManager *cache = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cache = [[self alloc] init];
    });
    return cache;
}

- (instancetype)init{
    if(self = [super init]){
        [self setupCache];
    }
    return self;
}

- (void)setupCache{
    _cache = [[NSCache alloc] init];
    _cache.countLimit = 100;
    _cache.totalCostLimit = 1024 * 1024 * 100;
}

- (nullable UIImage *)getImage:(NSString *)key{
    return [_cache objectForKey:key];
}

- (void)saveImage:(UIImage *)img key:(NSString *)key{
    [_cache setObject:img forKey:key];
}

- (void)removeAll{
    [_cache removeAllObjects];
}

@end
