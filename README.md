# iOS System Sounds in Titanium

You can use this module to provide audible system alerts. 

You can use it to play short (30 seconds or shorter) sounds. The interface does not provide 
level, positioning, looping, or timing control, and does not support simultaneous playback: 
You can play only one sound at a time. 

This module differs from the Sound module because it honors the ringtone volume, not the 
music volume.

Import the module with `require('ti.systemalert')` and use the `createSystemAlert()` method 
to create a `SystemAlert` object.

Read more about in Apple docs: [System Sound Services](https://developer.apple.com/reference/audiotoolbox/1657326-system_sound_services).

## Requirements

- [x] Titanium SDK 7.0.0+

## API's

### `SystemAlert(params)`

Create a new system alert by passing the `url` property to the creation dictionary.

#### Properties

##### `url`

The URL to pass to the system sound API.

#### Methods

##### `play()`

Start playing the system alert.

## Example

```js
var SystemAlert = require('ti.systemalert');

var mySystemAlert = SystemAlert.createSystemAlert({
    url: 'alert.wav'
});
mySystemAlert.play();
```

## Author

Hans Knöchel / Appcelerator

## License

MIT