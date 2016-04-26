//
//  FormValidator.h
//  Form-Validator
//
//  Created by Donny Davis on 4/26/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FormValidator : NSObject

- (BOOL)isValidName:(NSString *)nameString;
- (BOOL)isValidAddress:(NSString *)addressString;
- (BOOL)isValidCity:(NSString *)cityString;
- (BOOL)isValidState:(NSString *)stateString;
- (BOOL)isValidZipCode:(NSString *)zipCodeString;
- (BOOL)isValidPhoneNumber:(NSString *)phoneNumberString;

@end
