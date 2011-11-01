//
//  MoreImagePicker.h
//  MoreImagePicker
//
//  Created by taehoon koo on 10/31/11.
//  Copyright (c) 2011 Geekboard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@protocol SimpleImagePickerDelegate;

@interface SimpleImagePicker : NSObject <UIActionSheetDelegate,UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
}

@property (nonatomic,retain) IBOutlet id<SimpleImagePickerDelegate> delegate;

-(void) start;
@end

@protocol SimpleImagePickerDelegate <NSObject>

@required
-(void) imagePickerDelegate:(SimpleImagePicker *) moreImagePicker withPhoto:(UIImage *) image;
-(UIViewController *) viewControllerForImagePicker;
@end