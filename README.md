# PayconiqTestAssignment
This test assignment for Payconiq.

## Quick Start

* Swift 5.5
* Macintosh with Xcode 13.2 (Requires Mac OS 12.2)

# Setup

To run this application you need only Xcode 13.2. Any other software or lib is not required.

## Contribution guidelines

All `public` interface should be well documented in the code.

For `internal` and `private` code we should not need any documentation as most of the time it should be self explanatory. Only when the implementation is quire comple we should add a comment.

## Status

| Topic | Version |
| ---- | ----|
| UITest Included| YES (Use iPhone 13 Simulator)|
| Minimum iOS version | 15.0 |
| Swift Compatiblity | 5.5 |
| Public API | v.1.0.1 |
| --- | --- |

## Code formatting

This project uses Swift-format & Swift-lint to format the code. Make sure your code does not introduce any compiler/warining errors.

## Architecture
This test assignement follows a CLEAN swift architecture for each screen.  Each module contains following component.

`ViewController:`
The view controller should be responsible for manaaging views and responding to their interaction. It's also responsible for responding to other UI based notifications. i.e layout changes animations etc. The view controller sends interaction events to the 'interactor'

`Router`
The router takes care for the transition and passing data between view controllers. Also, you can use segues, unlike the VIPER architecture where you can’t do that.

`Interactor`
This is the “mediator” between the Viewcontroller and the Presenter. Here is how the Interactor works. First, it communicates with the ViewController which passes all the Request params needed for the presenter to present. Before proceeding to the presenter, a validation is done to check if everything is sent properly. The interactor passes that response towards the Presenter.

`Presenter`
Now that we have the Response from the Interactor, it’s time to format it into a ViewModel and pass the result back to the ViewController. Presenter will be in charge of the presentation logic. This component decides how the data will be presented to the user.

`Configurator`
This configurator used to configure all elements from viewcontroller.
