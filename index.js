/**
 * @format
 */

import { AppRegistry } from 'react-native'

import { name as appName } from './app.json'
import { name as keyboardName } from './keyboard.json'
import App from './src/app'
import Keyboard from './src/keyboard'

AppRegistry.registerComponent(appName, () => App)
AppRegistry.registerComponent(keyboardName, () => Keyboard)
