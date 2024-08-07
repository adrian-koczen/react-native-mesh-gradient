# react-native-mesh-gradient

Mesh Gradient for React Native

## Requirements

Mesh Gradient works only on iOS 18 or higher.
Mesh Gradient requires Xcode 16 or higher.

To change the default Xcode build version, run the following command:
```sh
sudo xcode-select -s /path/to/Xcode.app
```

To check the current Xcode build version, run the following command:
```sh
xcodebuild -version
```

## Preview

https://github.com/user-attachments/assets/cff00e3d-200f-47b6-b530-e4a856589e31

## Installation

```sh
yarn add react-native-mesh-gradient
```

## Usage

```js
import { MeshGradient } from 'react-native-mesh-gradient'

<MeshGradient
  style={{ flex: 1 }}
  points={[
    [0.0, 0.0], [1.0, 0.0],
    [0.0, 1.0], [1.0, 1.0]
  ]}
  colors={[
    '#ff0000', '#dd8015',
    '#15cce4', '#e6d10f'
  ]}
  animatedColors={[
    '#15cce4', '#0000ff',
    '#ff0000', '#dd8015'
  ]}
  animationDuration={5}
/>
```
