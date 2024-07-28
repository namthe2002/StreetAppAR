import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: ListView(
        children: [
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'Airplane Mode',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.airplanemode_active),
            title: Text('Airplane Mode'),
            trailing: Switch(
              value: false,
              onChanged: (value) {},
            ),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.wifi),
            title: Text('Wi-Fi'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.bluetooth),
            title: Text('Bluetooth'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person),
            title: Text('Personal Hotspot'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'CELLULAR',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.signal_cellular_alt),
            title: Text('Cellular Data'),
            trailing: Switch(
              value: true,
              onChanged: (value) {},
            ),
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Cellular Plans'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.person_pin_circle),
            title: Text('Personal Hotspot'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'NOTIFICATIONS',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.notifications_active),
            title: Text('Notifications'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.do_not_disturb),
            title: Text('Do Not Disturb'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.screen_lock_portrait),
            title: Text('Screen Time'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'SOUND AND HAPTICS',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.volume_up),
            title: Text('Volume'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.vibration),
            title: Text('Vibration'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),

          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'DISPLAY AND BRIGHTNESS',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.brightness_6),
            title: Text('Brightness'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.wallpaper),
            title: Text('Wallpaper'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'GENERAL',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.abc_outlined),
            title: Text('General'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.abc_rounded),
            title: Text('Safari'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.mail),
            title: Text('Mail'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contacts'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),

          Container(
            color: Colors.grey[200],
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Text(
              'ABOUT',
              style: TextStyle(fontSize: 16),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            trailing: Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
    );
  }
}
