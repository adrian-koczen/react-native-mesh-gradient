import { ViewStyle, requireNativeComponent } from 'react-native'

type Point = [number, number]

type Props = {
    style?: ViewStyle,
    points: Array<Point>,
    colors: Array<string>,
    animatedColors?: Array<string>,
    animationDuration?: number
}

/**
 * Basic usage of the MeshGradient component
 * @example
 * import { MeshGradient } from 'react-native-mesh-gradient'
 *
 * <MeshGradient
 *   style={{ flex: 1 }}
 *   points={[
 *     [0.0, 0.0], [1.0, 0.0],
 *     [0.0, 1.0], [1.0, 1.0]
 *   ]}
 *   colors={[
 *     '#ff0000', '#dd8015',
 *     '#15cce4', '#e6d10f'
 *   ]}
 *   animatedColors={[
 *     '#15cce4', '#0000ff',
 *     '#ff0000', '#dd8015'
 *   ]}
 *   animationDuration={5}
 * />
 */
const MeshGradient = requireNativeComponent<Props>('ReactNativeMeshGradient')

export {
    MeshGradient
}
