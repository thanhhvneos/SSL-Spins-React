import React from 'react';
import {
  StyleSheet,
  View,
  Text,
  Button,
  NativeModules,
} from 'react-native';

const App = () => {

  const onPress = () => {
    // console.log('pressed');
    const { RequestAPI } = NativeModules
    RequestAPI.getData('thanh', 'Ha Noi')
    // .then((data: any) => {
    //   console.log(data.temp)
    // })
    console.log('done!');
  }

  return <View style={styles.view}>
    <Text>Hello, world!</Text>
    <Button title='OK' onPress={onPress} />
  </View>
}

const styles = StyleSheet.create({
  view: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center'
  }
});

export default App;
