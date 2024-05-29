import 'package:get/get.dart';

class LanguageLocaleString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'th_TH': th,
        'en_US': en,
      };
  Map<String, String> th = {
    'close': 'ปิด',
    'department': 'แผนก',
    'product_list': 'รายการสินค้า',
  };
  Map<String, String> en = {
    'close': 'close',
    'department': 'Department Carousel',
    'product_list': 'Product list',
  };
}
