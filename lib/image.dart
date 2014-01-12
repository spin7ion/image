/**
 * The image library aims to provide server-side programs the ability to load,
 * manipulate, and save various image file formats.
 */
library image;

import 'dart:math' as Math;
import 'dart:typed_data' as Data;

import 'package:archive/archive.dart' as Arc;
import 'package:xml/xml.dart';

part 'src/formats/jpeg/_jpeg.dart';
part 'src/formats/jpeg/_jpeg_adobe.dart';
part 'src/formats/jpeg/_jpeg_component.dart';
part 'src/formats/jpeg/_jpeg_data.dart';
part 'src/formats/jpeg/_jpeg_frame.dart';
part 'src/formats/jpeg/_jpeg_jfif.dart';
part 'src/formats/jpeg/_jpeg_scan.dart';
part 'src/formats/formats.dart';
part 'src/formats/jpeg_decoder.dart';
part 'src/formats/jpeg_encoder.dart';
part 'src/formats/png_decoder.dart';
part 'src/formats/png_encoder.dart';
part 'src/formats/tga_decoder.dart';
part 'src/formats/tga_encoder.dart';

part 'src/draw/draw_char.dart';
part 'src/draw/draw_circle.dart';
part 'src/draw/draw_line.dart';
part 'src/filter/noise.dart';
part 'src/draw/draw_pixel.dart';
part 'src/draw/draw_rect.dart';
part 'src/draw/draw_string.dart';
part 'src/draw/fill.dart';
part 'src/draw/fill_rect.dart';

part 'src/effects/drop_shadow.dart';

part 'src/filter/brightness.dart';
part 'src/filter/bump_to_normal.dart';
part 'src/filter/color_offset.dart';
part 'src/filter/contrast.dart';
part 'src/filter/convolution.dart';
part 'src/filter/emboss.dart';
part 'src/filter/gaussian_blur.dart';
part 'src/filter/grayscale.dart';
part 'src/filter/invert.dart';
part 'src/filter/normalize.dart';
part 'src/filter/pixelate.dart';
part 'src/filter/remap_colors.dart';
part 'src/filter/seperable_convolution.dart';
part 'src/filter/seperable_kernel.dart';
part 'src/filter/smooth.dart';

part 'src/fonts/arial_14.dart';
part 'src/fonts/arial_24.dart';
part 'src/fonts/arial_48.dart';

part 'src/transform/copy_into.dart';
part 'src/transform/copy_crop.dart';
part 'src/transform/copy_resize.dart';
part 'src/transform/copy_rotate.dart';
part 'src/transform/flip.dart';

part 'src/util/clip_line.dart';
part 'src/util/interpolation.dart';
part 'src/util/min_max.dart';
part 'src/util/random.dart';

part 'src/bitmap_font.dart';
part 'src/color.dart';
part 'src/image.dart';
part 'src/image_exception.dart';
