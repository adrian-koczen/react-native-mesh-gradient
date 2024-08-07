# react-native-mesh-gradient

Mesh Gradient for React Native

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
