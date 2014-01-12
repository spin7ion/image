library image_test;

import 'dart:io' as Io;
import 'package:image/image.dart';
import 'package:unittest/unittest.dart';

part 'font_test.dart';
part 'jpeg_test.dart';
part 'png_test.dart';
part 'tga_test.dart';

void main() {
  defineTgaTests();
  defineJpegTests();
  definePngTests();
  defineFontTests();
  defineImageTests();
}


void defineImageTests() {
  group('image', () {
    Image image = readPng(new Io.File('res/trees.png').readAsBytesSync());
    Image image2 = readPng(new Io.File('res/alpha_edge.png').readAsBytesSync());

    test('fill', () {
      Image f = new Image(10, 10);
      int c = getColor(128, 255, 128, 255);
      f.fill(c);
      for (int i = 0; i < f.length; ++i) {
        expect(f[i], equals(c));
      }
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/fill.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('fillRect', () {
      Image f = new Image.from(image);
      int c = getColor(128, 255, 128, 255);
      fillRect(f, 50, 50, 150, 150, c);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/fillRect.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('add', () {
      Image i1 = new Image.from(image);
      Image i2 = new Image.from(image2);
      i1 += i2;
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/add.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(i1));
    });

    test('sub', () {
      Image i1 = new Image.from(image);
      Image i2 = new Image.from(image2);
      i1 -= i2;
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/sub.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(i1));
    });

    test('or', () {
      Image i1 = new Image.from(image);
      Image i2 = new Image.from(image2);
      i1 |= i2;
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/or.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(i1));
    });

    test('and', () {
      Image i1 = new Image.from(image);
      Image i2 = new Image.from(image2);
      i1 &= i2;
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/and.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(i1));
    });

    test('drawLine/drawCricle', () {
      Image f = new Image.from(image);
      int c1 = getColor(128, 255, 128, 255);
      drawLine(f, 0, 0, f.width, f.height, c1, thickness: 3);
      int c2 = getColor(255, 128, 128, 255);
      drawLine(f, f.width, 0, 0, f.height, c2, thickness: 5, antialias: true);
      drawCircle(f, 100, 100, 50, c1);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/drawLine.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('brightness', () {
      Image f = new Image.from(image);
      brightness(f, 100);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/brightness.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('copyResize', () {
      Image f = new Image.from(image);
      f = copyResize(f, 100);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/copyResize.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('colorOffset', () {
      Image f = new Image.from(image);
      colorOffset(f, 50, 0, 0, 0);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/colorOffset.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('contrast', () {
      Image f = new Image.from(image);
      contrast(f, 150);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/contrast.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('emboss', () {
      Image f = new Image.from(image);
      emboss(f);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/emboss.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('gaussianBlur', () {
      Image f = new Image.from(image);
      gaussianBlur(f, 10);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/gaussianBlur.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('grayscale', () {
      Image f = new Image.from(image);
      grayscale(f);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/grayscale.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('invert', () {
      Image f = new Image.from(image);
      invert(f);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/invert.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('NOISE_GAUSSIAN', () {
      Image f = new Image.from(image);
      noise(f, 10.0, type:NOISE_GAUSSIAN);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/noise_gaussian.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('NOISE_UNIFORM', () {
      Image f = new Image.from(image);
      noise(f, 10.0, type:NOISE_UNIFORM);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/noise_uniform.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('NOISE_SALT_PEPPER', () {
      Image f = new Image.from(image);
      noise(f, 10.0, type:NOISE_SALT_PEPPER);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/noise_salt_pepper.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('NOISE_POISSON', () {
      Image f = new Image.from(image);
      noise(f, 10.0, type:NOISE_POISSON);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/noise_poisson.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('NOISE_RICE', () {
      Image f = new Image.from(image);
      noise(f, 10.0, type:NOISE_RICE);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/noise_rice.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('normalize', () {
      Image f = new Image.from(image);
      normalize(f, 100, 255);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/normalize.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('pixelate', () {
      Image f = new Image.from(image);
      pixelate(f, 20, mode: PIXELATE_UPPERLEFT);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/PIXELATE_UPPERLEFT.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));

      f = new Image.from(image);
      pixelate(f, 20, mode: PIXELATE_AVERAGE);
      // Save the image as a PNG.
      fp = new Io.File('out/PIXELATE_AVERAGE.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('remapColors', () {
      Image f = new Image.from(image);
      remapColors(f, red: GREEN, green: RED);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/remapColors.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('rotate_90', () {
      Image f = new Image.from(image);
      Image r = copyRotate(f, 90);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/rotate_90.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(r));
    });

    test('rotate_180', () {
      Image f = new Image.from(image);
      Image r = copyRotate(f, 180);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/rotate_180.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(r));
    });

    test('rotate_270', () {
      Image f = new Image.from(image);
      Image r = copyRotate(f, 270);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/rotate_270.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(r));
    });

    test('rotate_45', () {
      Image f = new Image.from(image);
      Image r = copyRotate(f, 45);
      copyInto(f, r);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/rotate_45.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('smooth', () {
      Image f = new Image.from(image);
      smooth(f, 10);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/smooth.png');
      fp.createSync(recursive: true);
      fp.writeAsBytesSync(writePng(f));
    });

    test('copyInto', () {
      Image s = new Image.from(image);
      Image d = new Image(image.width + 20, image.height + 20, image.format);
      fill(d, 0xff0000ff);
      copyInto(d, s, dstX: 10, dstY: 10);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/copyInto.png')
                         ..createSync(recursive: true)
                         ..writeAsBytesSync(writePng(d));
    });

    test('dropShadow', () {
      Image s = new Image.from(image);
      Image d = dropShadow(s, 3, 3, 10);
      // Save the image as a PNG.
      Io.File fp = new Io.File('out/dropShadow.png')
                         ..createSync(recursive: true)
                         ..writeAsBytesSync(writePng(d));
    });
  });
}