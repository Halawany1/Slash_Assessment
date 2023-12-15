import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:slash_task/model/card_model.dart';
import 'package:slash_task/model/product_model.dart';


final product = Product(
  id: 1,
  name: 'iStock Product',
  description: "Make a statement with the retro-inspired Ringer T-shirt. Highlighted by contrasting color bands around the neckline and sleeves, this T-shirt adds a playful and sporty touch to your ensemble. It's a nod to vintage aesthetics, perfect for those who want to infuse a bit of nostalgia into their wardrobe.Each type of T-shirt offers a distinct style, allowing you to express your personality and preferences through your fashion choices. Whether you prefer a classic, polished look or a more casual and retro vibe, there's a T-shirt style to suit every taste.",
  brandId: 101,
  brandName: 'iStock Brand',
  brandLogoUrl:
      'https://i.pinimg.com/564x/9d/17/39/9d1739fc523639c06539462d8bd3dc14.jpg',
  rating: 4.5,
  variations: [
    ProductVariation(
      id: 101,
      productId: 1,
      price: 129.99,
      quantity: 80,
      inStock: true,
      productVariantImages: [
        'https://media.istockphoto.com/id/1404774625/photo/showing-thumbs-up-of-beautiful-asian-woman-isolated-on-white-background.jpg?s=2048x2048&w=is&k=20&c=KUhgJUpGcTY1Q62acGedaa7MKfq1QaKN494SJEyq6Qw=',
            'https://media.istockphoto.com/id/1177426301/photo/sexy-woman-or-girl-wearing-black-blank-t-shirt-with-space-for-your-logo-mock-up-or-design-in.jpg?s=2048x2048&w=is&k=20&c=huIsL4GfQzH9O-mn0HoyI8CTDnK_Vz6qfXAPFtObtLA=',
        'https://media.istockphoto.com/id/823304518/photo/happy-young-woman-standing-with-hands-in-pockets.jpg?s=2048x2048&w=is&k=20&c=AeoWfhQ9fSVBxgDQsh9JSo3ffvLoVw2GXreuisLu46s=',
        'https://media.istockphoto.com/id/1285768630/photo/studio-portrait-of-22-year-old-red-haired-woman.jpg?s=2048x2048&w=is&k=20&c=fk5cG4heSZQjnIuFzfhQPD629UIravBMVOiVJmmFzP0=',
      ],
      productPropertiesValues: [
        ProductPropertyAndValue(property: 'color', value: 'black'),
        ProductPropertyAndValue(property: 'size', value: '50x30'),
        ProductPropertyAndValue(property: 'size', value: 'dfssd'),
      ],
    ),
    ProductVariation(
      id: 101,
      productId: 1,
      price: 169.77,
      quantity: 4,
      inStock: true,
      productVariantImages: [
        'https://media.istockphoto.com/id/1015642208/photo/mockup-of-a-template-of-a-womans-t-shirt-color-on-a-white-background.jpg?s=2048x2048&w=is&k=20&c=IR_3f1BFPOHW8em_RNrPad6_9WpqcJQnRxJFsgkkJb0=',
        'https://media.istockphoto.com/id/692465276/photo/purple-v-neck-shirt-design-template.jpg?s=2048x2048&w=is&k=20&c=iBagrKtww-zzaERLUkfRWbYH2ybH_0E4LNbqLb93xs8='
      ],
      productPropertiesValues: [
        ProductPropertyAndValue(property: 'color', value: 'white'),
        ProductPropertyAndValue(property: 'size', value: '50x30'),
        ProductPropertyAndValue(property: 'size', value: 'dfssd'),
      ],
    ),
    ProductVariation(
      id: 101,
      productId: 1,
      price: 139.99,
      quantity: 2,
      inStock: true,
      productVariantImages: [
        'https://media.istockphoto.com/id/182174089/photo/ordinary-man-smiling.jpg?s=2048x2048&w=is&k=20&c=cmHYf7aKFLHg3Ay8T0lMxA5Zcj9J4gKx0NH8C70cW_s=',
        'https://media.istockphoto.com/id/1205014318/photo/teenager-boy-wearing-red-t-shirt-over-white-isolated-background-with-hand-on-chin-thinking.jpg?s=2048x2048&w=is&k=20&c=-8xxd4e6dTzXz_PvgnV1xQMCMdhk2JuNQiOPnELZHf0='
      ],
      productPropertiesValues: [
        ProductPropertyAndValue(property: 'color', value: 'red'),
        ProductPropertyAndValue(property: 'size', value: '100x100'),
        ProductPropertyAndValue(property: 'size', value: 'dfssd'),
      ],
    ),
    ProductVariation(
      id: 101,
      productId: 1,
      price: 159,
      quantity: 7,
      inStock: true,
      productVariantImages: [
        'https://media.istockphoto.com/id/183846686/photo/male-portrait.jpg?s=2048x2048&w=is&k=20&c=SEB9Q4UzGVJiv432pBeOjGjHbJhzV_K5STFdvknLk1E=',
        'https://media.istockphoto.com/id/513532927/photo/man-posing-with-blank-blue-shirt-tucked-in.jpg?s=2048x2048&w=is&k=20&c=c5a5oUGs3MWbH1zzo31u5hzUGLs7QyY7FH1s3nSw4F0=',
        'https://media.istockphoto.com/id/1081476136/photo/young-caucasian-hipster-man-wearing-blue-shirt-over-isolated-background-very-happy-and.jpg?s=2048x2048&w=is&k=20&c=jY3tZqUUXqBoNHsLuAYl_Lu1JMQrCo81AlJdgaWMzhA='
      ],
      productPropertiesValues: [
        ProductPropertyAndValue(property: 'color', value: 'blue'),
        ProductPropertyAndValue(property: 'size', value: '60x60'),
        ProductPropertyAndValue(property: 'size', value: 'dfssd'),
      ],
    ),
    ProductVariation(
      id: 101,
      productId: 1,
      price: 101.5,
      quantity: 10,
      inStock: true,
      productVariantImages: [
        'https://media.istockphoto.com/id/1263935192/photo/attractive-smiling-young-woman.jpg?s=2048x2048&w=is&k=20&c=ylDseNqNsBbmt_1AypJsGj-nfizYKbUg6FDS3rtjePc=',
      ],
      productPropertiesValues: [
        ProductPropertyAndValue(property: 'color', value: 'yellow'),
        ProductPropertyAndValue(property: 'size', value: '30x30'),
        ProductPropertyAndValue(property: 'size', value: 'dfssd'),
      ],
    ),

    // Add more variations as needed
  ],
  availableProperties: [
    ProductProperty(
      propertyName: 'color',
      propertyValues: [
        Colors.black,
        Colors.pink,
        Colors.red,
        Colors.blue,
        Colors.yellow
      ],
    ),
    ProductProperty(
      propertyName: 'size',
      propertyValues: ['20x20', '80x80', '120x120', '60x60'],
    ),
    ProductProperty(
      propertyName: 'material',
      propertyValues: ['Crew Neck', 'V-neck', 'Long Sleeve',
        'Ringer'],
    ),
  ],
);

final cartItem = CartItem(
  productVariationId: 101,
  quantity: 2,
);
