//
//  ImagePicker.m
//  Dopio
//
//  Created by taehoon koo on 8/9/11.
//  Copyright 2011 nts. All rights reserved.
//

#import "SimpleImagePicker.h"

@interface SimpleImagePicker()
@end
@implementation SimpleImagePicker
@synthesize delegate = mDelegate;

#pragma mark - Publish Method

-(void) start{
    NSString *productName = [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleDisplayName"];
    
    UIViewController *viewController = [self.delegate viewControllerForImagePicker];
    
    if(viewController == nil) {
        @throw [NSException exceptionWithName:@"ImagePicker" reason:@"viewControllerForImagePicker shouldn't return nil" userInfo:nil];
    }
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES ){
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:productName 
                                                                 delegate:self 
                                                        cancelButtonTitle:NSLocalizedString(@"Cancel",@"") 
                                                   destructiveButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Camera",@""),NSLocalizedString(@"Photo Album",@""), nil];
        [actionSheet showInView:viewController.view];
        [actionSheet release];
    }
    else {
        UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:productName delegate:self cancelButtonTitle:NSLocalizedString(@"Cancel",@"") destructiveButtonTitle:nil otherButtonTitles:NSLocalizedString(@"Photo Album",@""), nil];
        [actionSheet showInView:viewController.view];
        [actionSheet release];
    }
}

#pragma mark - UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    if([actionSheet cancelButtonIndex] == buttonIndex) {
        return;
    }
    
    UIViewController *viewController = [self.delegate viewControllerForImagePicker];
    
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.delegate = self;
    pickerController.allowsEditing = YES;
    
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == YES && buttonIndex == 0) { // Camera
        pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    }
    else {
        pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
    }
    [viewController presentModalViewController:pickerController animated:YES];
    [pickerController release];
}

#pragma mark - UIImagePickerControllerDelegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    if(nil == image) {
        image = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    [self.delegate imagePickerDelegate:self withPhoto:image];
    [picker dismissModalViewControllerAnimated:YES];
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissModalViewControllerAnimated:YES];
}

#pragma mark - init & dealloc
-(void) dealloc {
    self.delegate = nil;
    [super dealloc];
}


@end
