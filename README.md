# Homework 09

## Form-Validator

Create a single view application that shows textfields for name, street address, city, state, zip code and phone number. After each field is filled out, validate the data in the field and only allow the user to move on if the data in the field is valid. Once all fields have been filled out, hide the onscreen keyboard.

### Steps to Success
### Storyboard Tasks
* [ ] Add six textfields to the view.
* [ ] Center the first textfield horizontally with the superview.
* [ ] Set a proportional width of the first textfield as 80% the width of the superview.
* [ ] Set a top space constraint on the first textfield with a value of 8 points from the top layout guide.
* [ ] set the placeholder text for the TextFields as [ Name, Address, City, State, Zip Code, Phone Number]
* [ ] set the address and City TextFields to be equal widths of the Name TextField
* [ ] Align the tops of the Zip Code TextFields underneath the City TextField
* [ ] put the Phone Number TextField underneatht the State and Zip.
* [ ] separate each row by 8 pts.
* [ ] Create properties for each TextField

### Code Tasks
* [ ] Set the title of the view in viewDidLoad to "Validator"
* [ ] Set the view controller as a delegate of UITextField.
* [ ] Create one method in FormValidator per TextField that will validate the contents of that TextField.
* [ ] following the pattern we used in class, continue checking the contents of the current TextField before moving on to the next field with resignFirstResponder and becomeFirstResponder
* [ ] Once you have checked and validated all of the TextFields, hide the keyboard.