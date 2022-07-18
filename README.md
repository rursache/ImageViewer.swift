ImageViewer.swift
=======================

An easy to use Image Viewer that is inspired by Facebook

[![Version](https://img.shields.io/cocoapods/v/ImageViewer.swift.svg?style=flat)](https://cocoapods.org/pods/ImageViewer.swift)
[![Deployment status](https://github.com/michaelhenry/ImageViewer.swift/workflows/deploy_to_cocoapods/badge.svg)](https://github.com/michaelhenry/ImageViewer.swift/actions)
[![License](https://img.shields.io/cocoapods/l/ImageViewer.swift.svg?style=flat)](https://cocoapods.org/pods/ImageViewer.swift)
[![Platform](https://img.shields.io/cocoapods/p/ImageViewer.swift.svg?style=flat)](https://cocoapods.org/pods/ImageViewer.swift)

![Screenshot-dark-mode](images/dark-mode.gif)![Screenshot-light-mode](images/light-mode.gif)
![Screenshot-auto-rotate](images/auto-rotate.gif)

# Supports

- From iOS 10
- Swift versions
	- Swift 4.0
	- Swift 4.2
	- Swift 5.0

## Installation

Use SPM

## How to use it

```swift
UIImageView.setupImageViewer()
```

Example:

```swift
import ImageViewer_swift

let imageView = UIImageView()
imageView.image = UIImage(named: 'cat1')
...
imageView.setupImageViewer()
```

Or you might load it with an array of images `[UIImage]`

```swift
let images = [
    UIImage(named: "cat1"),
    UIImage(named: "cat1"),
    UIImage(named: "cat1")
]
imageView.setupImageViewer(images: images)
```

### How to change the layout or options that are available

You can check this file [ImageViewerOption.swift](https://github.com/michaelhenry/ImageViewer.swift/blob/master/Sources/ImageViewerOption.swift) to see what are the available options that will fit to your needs.

```swift
public enum ImageViewerOption {
    case theme(ImageViewerTheme)
    case closeIcon(UIImage)
    case rightNavItemTitle(String, onTap: ((Int) -> Void)?)
    case rightNavItemIcon(UIImage, onTap: ((Int) -> Void)?)
}
```

# License

MIT

Copyright (c) 2013 Michael Henry Pantaleon (http://www.iamkel.net). All rights reserved.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
