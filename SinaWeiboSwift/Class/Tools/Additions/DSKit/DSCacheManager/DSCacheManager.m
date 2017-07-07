//
//  DSCacheManager.m
//  DSDeveloperKit
//
//  Created by FengDongsheng on 12/11/30.
//  Copyright (c) 2012年 FengDongsheng. All rights reserved.
//

#import "DSCacheManager.h"

@implementation DSCacheManager

+ (void)writToFileByImage:(UIImage *)image withImageName:(NSString *)imageName{
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory,NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSString *testDirectory = [libraryDirectory stringByAppendingPathComponent:@"appCache"];
    NSString *imagePath = [testDirectory stringByAppendingPathComponent:@"image"];
    BOOL isDirExist = [fileManager fileExistsAtPath:imagePath];
    if (isDirExist) {
        
    }else {
        [fileManager createDirectoryAtPath:imagePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
    NSString *testPath = [imagePath stringByAppendingPathComponent:imageName];
    NSData *imageData = UIImagePNGRepresentation(image);
    [imageData writeToFile:testPath atomically:NO];
}

+ (UIImage *)getFileByImage:(NSString *)imageName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *libraryDirectory = [paths objectAtIndex:0];
    NSString *testDirectory = [libraryDirectory stringByAppendingPathComponent:@"appCache"];
    NSString *imagePath = [testDirectory stringByAppendingPathComponent:@"image"];
    NSString *testPath = [imagePath stringByAppendingPathComponent:imageName];
    UIImage *imgFromUrl3 = [[UIImage alloc] initWithContentsOfFile:testPath];
    return imgFromUrl3;
}

@end
