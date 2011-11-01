//
//  ViewController.m
//  SimpleImagePickerSample
//
//  Created by taehoon koo on 11/1/11.
//  Copyright (c) 2011 Geekboard. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController
@synthesize imageView = mImageView;
@synthesize imagePicker = mImagePicker;

#pragma mark - View Life Cycle
-(void) viewDidUnload {
    [super viewDidUnload];
    self.imageView = nil;
    self.imagePicker = nil;
}

#pragma mark - IBActions
-(IBAction)pressStart:(id)sender {
    [self.imagePicker start];
}

#pragma mark - SimpleImagePickerDelegate
-(void) imagePickerDelegate:(SimpleImagePicker *) moreImagePicker withPhoto:(UIImage *) image {
    self.imageView.image = image;
}
-(UIViewController *) viewControllerForImagePicker {
    return self;
}
@end
