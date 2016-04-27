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

@property (strong, nonatomic) NSArray *states;
@property (strong, nonatomic) UIPickerView *statePickerView;

- (void)displayError:(NSString *)title message:(NSString *)message;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Let's set our title for the view
    self.title = @"Validator";
    
    // Initialize our form validator before we forget again
    self.formValidator = [[FormValidator alloc] init];
    
    // Set up our UIPickerView and attach it to the states text field
    self.statePickerView = [[UIPickerView alloc] init];
    self.statePickerView.delegate = self;
    self.statePickerView.dataSource = self;
    self.statePickerView.showsSelectionIndicator = YES;
    self.stateTextField.inputView = self.statePickerView;
    
    // Set up the available states
    self.states = @[@"", @"GA", @"NC"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if ([textField isEqual:self.nameTextField]) {
        if ([self.formValidator isValidName:textField.text]) {
            [self.nameTextField resignFirstResponder];
            [self.addressTextField becomeFirstResponder];
            self.nameTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.nameTextField.backgroundColor = [UIColor redColor];
            [self displayError:@"Danger" message:@"Invalid name.Enter first and last name."];
        }
        
    } else if ([textField isEqual:self.addressTextField]) {
        if ([self.formValidator isValidAddress:textField.text]) {
            [self.addressTextField resignFirstResponder];
            [self.cityTextField becomeFirstResponder];
            self.addressTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.addressTextField.backgroundColor = [UIColor redColor];
            [self displayError:@"Danger" message:@"Invalid address."];
        }
        
    } else if ([textField isEqual:self.cityTextField]) {
        if ([self.formValidator isValidCity:textField.text]) {
            [self.cityTextField resignFirstResponder];
            [self.stateTextField becomeFirstResponder];
            self.cityTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.cityTextField.backgroundColor = [UIColor redColor];
            [self displayError:@"Danger" message:@"Invalid city"];
        }
        
    } else if ([textField isEqual:self.stateTextField]) {
        if ([self.formValidator isValidState:textField.text]) {
            [self.stateTextField resignFirstResponder];
            [self.zipTextField becomeFirstResponder];
            self.stateTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.stateTextField.backgroundColor = [UIColor redColor];
            [self displayError:@"Danger" message:@"Invalid state. Enter two digit state code."];
        }
        
    } else if ([textField isEqual:self.zipTextField]) {
        if ([self.formValidator isValidZipCode:textField.text]) {
            [self.zipTextField resignFirstResponder];
            [self.phoneTextField becomeFirstResponder];
            self.zipTextField.backgroundColor = [UIColor clearColor];
            return YES;
        } else {
            self.zipTextField.backgroundColor = [UIColor redColor];
            [self displayError:@"Danger" message:@"Invalid zip code. Make sure it is five digits."];
        }
        
    } else if ([textField isEqual:self.phoneTextField]) {
        if ([self.formValidator isValidPhoneNumber:textField.text]) {
            [self.phoneTextField resignFirstResponder];
            self.phoneTextField.backgroundColor = [UIColor clearColor];
            
            // Present an alert controller if evertyhing passes validation
            [self displayError:@"Sweetness" message:@"Boom! All the things validate!"];
            
            return YES;
        } else {
            self.phoneTextField.backgroundColor = [UIColor redColor];
            [self displayError:@"Danger" message:@"Invalid phone number."];
        }
        
    }
    
    return NO;
}

#pragma mark - UIPickerViewDelegate

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return self.states[row];
}

#pragma mark - UIPickerViewDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return self.states.count;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.stateTextField.text = self.states[row];
}

#pragma mark - Error handling

- (void)displayError:(NSString *)title message:(NSString *)message {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:nil];
    [alertController addAction:okAction];
    [self presentViewController:alertController animated:YES completion:nil];
}

@end
