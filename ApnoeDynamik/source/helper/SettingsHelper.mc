using Toybox.Application;

class SettingsHelper {

    static var valueChangedListener = [];

    // The propName as defined in properties.xml
    static function get(propName) {
        return Application.getApp().getProperty(propName);
    }

    static function set(propName, value) {
        Application.getApp().setProperty(propName, value);
        for (var i = 0; i < valueChangedListener.size(); i++) {
            var currentListener = valueChangedListener[i];
            currentListener.invoke();
        }
    }

    static function listenOnSettingsChanged(listener) {
        valueChangedListener.add(listener);
    }

    static function stopListenOnSettingsChanged(listener) {
        valueChangedListener.remove(listener);
    }
}