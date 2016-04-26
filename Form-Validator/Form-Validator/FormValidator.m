//
//  FormValidator.m
//  Form-Validator
//
//  Created by Donny Davis on 4/26/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "FormValidator.h"

@implementation FormValidator

- (BOOL)isValidName:(NSString *)nameString {
    // Check that we have more than one word to be a valid name.
    return [[nameString componentsSeparatedByString:@" "] count] > 1;
}

- (BOOL)isValidAddress:(NSString *)addressString {
    // This sets up a type checker for the data detector to perform against
    NSTextCheckingType detectorType = NSTextCheckingTypeAddress;
    
    // In case we want to capture any errors returned from NSDataDetector.
    // Could pass nil if we didn't care.
    NSError *error;
    
    // Create a data detector to validate our string against.
    // This will run our string through validations for NSTextCheckingTypeAddress.
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:detectorType error:&error];
    
    // Use __block to define our boolean value so that it will be kept in memory along with the block
    // that it is being used in.
    __block BOOL rc = NO;
    
    // Loop over our string using the data detector.
    // If everything is peachy then it will return YES, otherwise rc will remain as NO.
    [dataDetector enumerateMatchesInString:addressString options:kNilOptions range:NSMakeRange(0, addressString.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        rc = YES;
    }];
    
    return rc;
}

- (BOOL)isValidCity:(NSString *)cityString {
    return cityString.length > 0;
}

- (BOOL)isValidState:(NSString *)stateString {
    return stateString.length == 2;
}

- (BOOL)isValidZipCode:(NSString *)zipCodeString {
    // Let's create a character set that will store the values that we want to be valid
    NSCharacterSet *set = [NSCharacterSet characterSetWithCharactersInString:@"0123456789"];
    
    // Checking for our values we want to check against the inverse of our set.
    // This will give us a set of invalid values. We make sure that our string does
    // not contain any of those characters and that it is equal to a length of 5 to
    // be valid.
    return ([zipCodeString rangeOfCharacterFromSet:[set invertedSet]].location == NSNotFound) && zipCodeString.length == 5;
}

- (BOOL)isValidPhoneNumber:(NSString *)phoneNumberString {
    // Set up a type to check the text against.
    NSTextCheckingType detectorType = NSTextCheckingTypePhoneNumber;
    
    // In case we want to catch some errors.
    NSError *error;
    
    // Create a data detector to validate our phone number against.
    NSDataDetector *dataDetector = [NSDataDetector dataDetectorWithTypes:detectorType error:&error];
    
    // Set up our boolean value to return
    __block BOOL rc = NO;
    
    // Loop over our string to make sure it's a valid phone number
    [dataDetector enumerateMatchesInString:phoneNumberString options:kNilOptions range:NSMakeRange(0, phoneNumberString.length) usingBlock:^(NSTextCheckingResult * _Nullable result, NSMatchingFlags flags, BOOL * _Nonnull stop) {
        rc = YES;
    }];
    
    return rc;
}

@end
