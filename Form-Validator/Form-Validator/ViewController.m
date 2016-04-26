//
//  ViewController.m
//  Form-Validator
//
//  Created by Donny Davis on 4/26/16.
//  Copyright © 2016 Donny Davis. All rights reserved.
//

#import "ViewController.h"
#import "FormValidator.h"

@interface ViewController () <UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *addressTextField;
@property (weak, nonatomic) IBOutlet UITextField *cityTextField;
@property (weak, nonatomic) IBOutlet UITextField *zipTextField;
@property (weak, nonatomic) IBOutlet UITextField *stateTextField;
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@property (strong, nonatomic) FormValidator *formValidator;

@property (strong, nonatomic) UIPickerView *statePickerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Let's set our title for the view
    self.title = @"Validator";
    
    // Initialize our form validator before we forget again
    self.formValidator = [[FormValidator alloc] init];
    self.statePickerView = [[UIPickerView alloc] init];
    self.statePickerView.delegate = self;
    self.statePickerView.dataSource = self;
    self.statePickerView.showsSelectionIndicator = YES;
    self.stateTextField.inputView = self.statePickerView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (void)textFieldDidBeginEditing:(UITextField *)textField {
//    if ([textField isEqual:self.stateTextField]) {
//        [self.stateTextField resignFirstResponder];
//    }
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
            
            // Present an alert controller if evertyhing passes validation
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Sweetness" message:@"Boom! All the things validate!" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
            [alertController addAction:okAction];
            [self presentViewController:alertController animated:YES completion:nil];
            
            return YES;
        } else {
            self.phoneTextField.backgroundColor = [UIColor redColor];
        }
        
    }
    
    return NO;
}

#pragma mark - UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return @"NC";
}

#pragma mark - UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return 2;
}

@end
