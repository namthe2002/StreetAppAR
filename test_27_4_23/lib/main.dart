void main() {
  Map<String, dynamic> data = {
    "status": 1,
    "mediaUrl": "https://media.thovang5.com/",
    "items": [
      {
        "id": 0,
        "name": "Hide",
        "state": 0,
        "createdAt": "2024-06-27T09:09:25",
        "description": "Ẩn livestream"
      },
      {
        "id": 1,
        "name": "main_banner",
        "state": 1,
        "createdAt": "2024-07-17T10:29:04",
        "description": "https://35.240.253.109/static/images/banner%20mission.png;https://35.240.253.109/doi-ca-rot"
      },
      {
        "id": 2,
        "name": "home_live_tabs",
        "state": 1,
        "createdAt": "2024-07-17T11:22:48",
        "description": "Trận Hot;isHighlight=1*sportTypes=1,22,3*status=0,1,3|Trực tiếp;sportTypes=1,22,3*status=1|Hôm nay;sportTypes=1,22,3*status=0,1,3*fromDate=0*toDate=1"
      },
      {
        "id": 3,
        "name": "live_ads",
        "state": 1,
        "createdAt": "2024-07-17T11:33:19",
        "description": "<b>Join Telegram<br>Nhận ngay 500k</b>;https://t.me/+lQrYDtyNcOowZjJl"
      }
    ]
  };

  // Tìm phần tử có id = 2
  var item = data['items'].firstWhere((x) => x['id'] == 2, orElse: () => null);

  if (item != null) {
    String description = item['description'];
    // Tách dữ liệu từ description
    List<Map<String, dynamic>> parsedData = [];

    List<String> sections = description.split('|');

    for (var section in sections) {
      List<String> parts = section.split(';');
      String title = parts[0];
      Map<String, String> conditions = {};

      if (parts.length > 1) {
        List<String> conditionsParts = parts[1].split('*');
        for (var condition in conditionsParts) {
          List<String> keyValue = condition.split('=');
          if (keyValue.length == 2) {
            conditions[keyValue[0]] = keyValue[1];
          }
        }
      }

      parsedData.add({
        'title': title,
        'conditions': conditions,
      });
    }

    print(parsedData);
  } else {
    print("Không tìm thấy phần tử có id = 2");
  }
}
