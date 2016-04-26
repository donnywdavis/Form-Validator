//
//  ViewController.m
//  Form-Validator
//
//  Created by Donny Davis on 4/26/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "ViewController.h"
#import "FormValidator.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (strong, nonatomic) FormValidator *formValidator;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Let's set our title for the view
    self.title = @"Validator";
    
    // Initialize our form validator before we forget again
    self.formValidator = [[FormValidator alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.nameTextField]) {
        if ([self.formValidator isValidName:textField.text]) {
            [self.nameTextField resignFirstResponder];
            [self.addressTextField becomeFirstResponder];
            self.nameTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.nameTextField.backgroundColor = [UIColor redColor];
        }
        
    } else if ([textField isEqual:self.addressTextField]) {
        if ([self.formValidator isValidAddress:textField.text]) {
            [self.addressTextField resignFirstResponder];
            [self.cityTextField becomeFirstResponder];
            self.addressTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.addressTextField.backgroundColor = [UIColor redColor];
        }
        
    } else if ([textField isEqual:self.cityTextField]) {
        if ([self.formValidator isValidCity:textField.text]) {
            [self.cityTextField resignFirstResponder];
            [self.stateTextField becomeFirstResponder];
            self.cityTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.cityTextField.backgroundColor = [UIColor redColor];
        }
        
    } else if ([textField isEqual:self.stateTextField]) {
        if ([self.formValidator isValidState:textField.text]) {
            [self.stateTextField resignFirstResponder];
            [self.zipTextField becomeFirstResponder];
            self.stateTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.stateTextField.backgroundColor = [UIColor redColor];
        }
        
    } else if ([textField isEqual:self.zipTextField]) {
        if ([self.formValidator isValidZipCode:textField.text]) {
            [self.zipTextField resignFirstResponder];
            [self.phoneTextField becomeFirstResponder];
            self.zipTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.zipTextField.backgroundColor = [UIColor redColor];
        }
        
    } else if ([textField isEqual:self.phoneTextField]) {
        if ([self.formValidator isValidPhoneNumber:textField.text]) {
            [self.phoneTextField resignFirstResponder];
            self.phoneTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.phoneTextField.backgroundColor = [UIColor redColor];
        }
        
    }
    
    return NO;
}

@end
