//
//  ViewController.h
//  SimpleImagePickerSample
//
//  Created by taehoon koo on 11/1/11.
//  Copyright (c) 2011 Geekboard. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SimpleImagePicker.h"
@interface ViewController : UIViewController <SimpleImagePickerDelegate>

@property (nonatomic,assign) IBOutlet UIImageView *imageView;
@property (nonatomic,retain) IBOutlet SimpleImagePicker *imagePicker;

-(IBAction)pressStart:(id)sender;

@end
