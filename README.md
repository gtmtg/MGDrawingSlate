#MGDrawingSlate

##Introduction
MGDrawingSlate is a simple, customizable, and easy-to-use UIView subclass that allows developers to easily embed a drawing view within their app. It is based on [this tutorial](http://soulwithmobiletechnology.blogspot.com/2011/05/uibezierpath-tutorial-for-iphone-sdk-40.html) but includes several enhancements, and utilizes a UIBezierPath to create a smooth path that follows the user's finger movements on the drawing slate. This implementation allows for a great deal of customizability, allowing developers (and, by extension, users) to easily change the drawing color, thickness, etc. Download it and give it a try!

##Usage
Simply copy ```MGDrawingSlate.h``` and ```MGDrawingSlate.m``` to your project. Then, in the view controller in which you want to embed the drawing slate, add ```import MGDrawingSlate.h```.

To create the MGDrawingSlate, use

    MGDrawingSlate *drawingSlate = [[MGDrawingSlate alloc] initWithFrame:CGRectMake(x, y, width, height)];
    [drawingSlate addToSubview];

Alternatively, if you would prefer to position and size the drawing slate in Interface Builder itself, just create a view and change its class to MGDrawingSlate in the Inspector.

In addition, you can do several other things with the the MGDrawingSlate, like clear it and export the drawing to the user's camera roll. See the included demo application and its source code for ways to implement these. 

##Customization
Because the MGDrawingSlate uses a UIBezierPath, it offers a lot of customizability right out of the box. In addition, MGDrawingSlate includes methods that make it easier to customize frequently-modified properties of the drawing path, namely the color and the line weight. To change the color, use

    [drawingSlate changeColorTo:whateverUIColorYouWant];

and to change the line weight, use:

    [drawingSlate changeLineWeightTo:whateverIntegerYouWant];

Of course, you can also change any properties of the drawing slate's ```drawingPath``` directly. Just use

    drawingSlate->drawingPath.propertyToChange = desiredValue;

See the [UIBezierPath documentation](http://developer.apple.com/library/ios/#documentation/uikit/reference/UIBezierPath_class/Reference/Reference.html) for more information on the properties you can change.

##License and Copyright
MGDrawingSlate is open-source and is licensed under the MIT License. To put it simply, this means that you can use it in both free and commercial work with a few conditions. For more information, see the license file included with this source code or visit http://opensource.org/licenses/MIT.

MGDrawingSlate is © 2012 Mihir Garimella. Some rights reserved. See the license file or visit the link above for more information.

##Other Information
The demo application included with this source code is also licensed under the MIT License and is © 2012 Mihir Garimella. In addition to MGDrawingSlate, the demo application uses the [InfColorPicker](https://github.com/InfinitApps/InfColorPicker), which is © 2011 InfinitApps.
