import 'package:flutter/material.dart';

/// Item model representing each vegetable product in the cart.
class CartProduct {
  final String id;
  final String name;
  final String subtitle;
  final double price;
  final String unit;
  int quantity;
  final Widget illustration;

  CartProduct({
    required this.id,
    required this.name,
    required this.subtitle,
    required this.price,
    this.unit = 'per kg',
    required this.quantity,
    required this.illustration,
  });
}

class PracticeExercise extends StatefulWidget {
  const PracticeExercise({super.key});

  @override
  State<PracticeExercise> createState() => _PracticeExerciseState();
}

class _PracticeExerciseState extends State<PracticeExercise> {
  // Theme palette matching the design
  static const Color backgroundColor = Color(0xFFFAF7F0);
  static const Color cardColor = Color(0xFFEFE9DE);
  static const Color primaryGreen = Color(0xFF748537);
  static const Color darkText = Color(0xFF1F1F1F);
  static const Color mutedText = Color(0xFF8B8880);
  static const Color dividerColor = Color(0xFFD6DEC2);

  late List<CartProduct> _cartItems;

  @override
  void initState() {
    super.initState();
    _initCartItems();
  }

  void _initCartItems() {
    _cartItems = [
      CartProduct(
        id: '1',
        name: 'Tomato',
        subtitle: 'Lorem ipsum dolor sit',
        price: 5.17,
        quantity: 2,
        illustration: const TomatoIllustration(),
      ),
      CartProduct(
        id: '2',
        name: 'Pumpkin',
        subtitle: 'Lorem ipsum dolor sit',
        price: 3.85,
        quantity: 1,
        illustration: const PumpkinIllustration(),
      ),
      CartProduct(
        id: '3',
        name: 'Carrots',
        subtitle: 'Lorem ipsum dolor sit',
        price: 1.17,
        quantity: 5,
        illustration: const CarrotsIllustration(),
      ),
      CartProduct(
        id: '4',
        name: 'Broccoli',
        subtitle: 'Lorem ipsum dolor sit',
        price: 4.75,
        quantity: 3,
        illustration: const BroccoliIllustration(),
      ),
      CartProduct(
        id: '5',
        name: 'Bell Pepper',
        subtitle: 'Lorem ipsum dolor sit',
        price: 9.00,
        quantity: 1,
        illustration: const BellPepperIllustration(),
      ),
    ];
  }

  double get _subtotal =>
      _cartItems.fold(0.0, (sum, item) => sum + (item.price * item.quantity));

  String _formatPrice(double value) {
    return '${value.toStringAsFixed(2).replaceAll('.', ',')}\$';
  }

  void _increment(int index) {
    setState(() {
      _cartItems[index].quantity++;
    });
  }

  void _decrement(int index) {
    if (_cartItems[index].quantity > 1) {
      setState(() {
        _cartItems[index].quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            // Top App Bar
            _buildAppBar(),

            // Thin divider below app bar
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Divider(color: dividerColor, height: 1, thickness: 1),
            ),

            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 16.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // List of items
                    ...List.generate(_cartItems.length, (index) {
                      final item = _cartItems[index];
                      return _buildCartItemCard(item, index);
                    }),

                    const SizedBox(height: 12),

                    // Disclaimer / Lorem ipsum description
                    const Text(
                      'Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.\n\n',
                      style: TextStyle(
                        fontSize: 9.5,
                        height: 1.35,
                        color: mutedText,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                    // const SizedBox(height: 16),

                    // Divider before Subtotal
                    const Divider(color: dividerColor, height: 1, thickness: 1),

                    const SizedBox(height: 16),

                    // Subtotal
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        const Text(
                          'Subtotal:  ',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: darkText,
                          ),
                        ),
                        Text(
                          _formatPrice(_subtotal),
                          style: const TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w900,
                            color: darkText,
                            letterSpacing: -0.5,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 24),

                    // Checkout Button
                    SizedBox(
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                'Order placed! Subtotal: ${_formatPrice(_subtotal)}',
                              ),
                              backgroundColor: primaryGreen,
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryGreen,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26),
                          ),
                        ),
                        child: const Text(
                          'Checkout',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            letterSpacing: 0.2,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        children: [
          // Back button
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: primaryGreen,
              size: 22,
            ),
            onPressed: () {
              if (Navigator.canPop(context)) {
                Navigator.pop(context);
              }
            },
          ),
          const SizedBox(width: 14),

          // Title
          const Text(
            'Your Cart',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w800,
              color: darkText,
              letterSpacing: -0.5,
            ),
          ),

          const Spacer(),

          // Eco cart icon
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.shopping_cart_outlined,
                color: primaryGreen,
                size: 26,
              ),
              Positioned(
                top: -5,
                right: -2,
                child: Transform.rotate(
                  angle: 0.3,
                  child: const Icon(
                    Icons.eco_rounded,
                    color: primaryGreen,
                    size: 15,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 16),

          // Notification bell with badge
          Stack(
            clipBehavior: Clip.none,
            children: [
              const Icon(
                Icons.notifications_none_rounded,
                color: primaryGreen,
                size: 26,
              ),
              Positioned(
                top: 1,
                right: 2,
                child: Container(
                  width: 7,
                  height: 7,
                  decoration: const BoxDecoration(
                    color: Color(0xFFD35532),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCartItemCard(CartProduct item, int index) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12.0),
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 12.0),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Vegetable Illustration
          SizedBox(
            width: 76,
            height: 60,
            child: Center(child: item.illustration),
          ),

          const SizedBox(width: 12),

          // Name, subtitle, price, unit
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  item.name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: darkText,
                  ),
                ),
                const SizedBox(height: 1),
                Text(
                  item.subtitle,
                  style: const TextStyle(fontSize: 10, color: mutedText),
                ),
                const SizedBox(height: 4),
                Text(
                  _formatPrice(item.price),
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w900,
                    color: darkText,
                    letterSpacing: -0.3,
                  ),
                ),
                Text(
                  item.unit,
                  style: const TextStyle(
                    fontSize: 9.5,
                    color: mutedText,
                    height: 1.0,
                  ),
                ),
              ],
            ),
          ),

          // Stepper: [-] [qty] [+]
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildStepButton(
                icon: Icons.remove,
                onTap: () => _decrement(index),
              ),
              const SizedBox(width: 6),
              Container(
                width: 26,
                height: 26,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                alignment: Alignment.center,
                child: Text(
                  '${item.quantity}',
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w800,
                    color: darkText,
                  ),
                ),
              ),
              const SizedBox(width: 6),
              _buildStepButton(icon: Icons.add, onTap: () => _increment(index)),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStepButton({
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return Material(
      color: primaryGreen,
      borderRadius: BorderRadius.circular(5),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(5),
        child: SizedBox(
          width: 26,
          height: 26,
          child: Icon(icon, size: 15, color: Colors.white),
        ),
      ),
    );
  }
}

/// Alias for flexible naming convention
typedef PracticeExerciseScreen = PracticeExercise;

// =======================================================================
// CUSTOM VEGETABLE ILLUSTRATIONS (Pixel-perfect vectors matching design)
// =======================================================================

class TomatoIllustration extends StatelessWidget {
  const TomatoIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(70, 50), painter: _TomatoPainter());
  }
}

class _TomatoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final redPaint = Paint()..color = const Color(0xFFE2432B);
    final darkRedPaint = Paint()..color = const Color(0xFFC7301E);
    final highlightPaint = Paint()..color = const Color(0xFFFF7E6B);
    final greenPaint = Paint()
      ..color = const Color(0xFF4A6B29)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;

    // Vine stems
    final stemPath = Path()
      ..moveTo(size.width * 0.15, size.height * 0.4)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.25,
        size.width * 0.85,
        size.height * 0.45,
      );
    canvas.drawPath(stemPath, greenPaint);

    // Branchlets
    canvas.drawLine(
      Offset(size.width * 0.28, size.height * 0.33),
      Offset(size.width * 0.28, size.height * 0.45),
      greenPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.5, size.height * 0.29),
      Offset(size.width * 0.5, size.height * 0.45),
      greenPaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.72, size.height * 0.38),
      Offset(size.width * 0.72, size.height * 0.5),
      greenPaint,
    );

    // Tomatoes in vine cluster
    void drawTomato(Offset center, double radius) {
      canvas.drawCircle(center, radius, darkRedPaint);
      canvas.drawCircle(
        Offset(center.dx - 1, center.dy - 1),
        radius * 0.9,
        redPaint,
      );
      // Small shine
      canvas.drawCircle(
        Offset(center.dx - radius * 0.35, center.dy - radius * 0.35),
        radius * 0.25,
        highlightPaint,
      );
    }

    // Left tomato
    drawTomato(Offset(size.width * 0.18, size.height * 0.65), 11);
    // Left-middle tomato
    drawTomato(Offset(size.width * 0.38, size.height * 0.68), 12.5);
    // Center-right tomato
    drawTomato(Offset(size.width * 0.60, size.height * 0.62), 12);
    // Far-right tomato
    drawTomato(Offset(size.width * 0.80, size.height * 0.69), 11);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class PumpkinIllustration extends StatelessWidget {
  const PumpkinIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(60, 50), painter: _PumpkinPainter());
  }
}

class _PumpkinPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final yellowPaint = Paint()..color = const Color(0xFFFFC72C);
    final orangeEdge = Paint()
      ..color = const Color(0xFFD48B17)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.0;
    final seedArea = Paint()..color = const Color(0xFFE89E23);
    final seedPaint = Paint()..color = const Color(0xFFFFF2D1);

    final path = Path()
      ..moveTo(size.width * 0.25, size.height * 0.2)
      ..cubicTo(
        size.width * 0.05,
        size.height * 0.3,
        size.width * 0.05,
        size.height * 0.8,
        size.width * 0.35,
        size.height * 0.95,
      )
      ..cubicTo(
        size.width * 0.7,
        size.height * 0.98,
        size.width * 0.9,
        size.height * 0.8,
        size.width * 0.85,
        size.height * 0.45,
      )
      ..cubicTo(
        size.width * 0.75,
        size.height * 0.25,
        size.width * 0.45,
        size.height * 0.15,
        size.width * 0.25,
        size.height * 0.2,
      )
      ..close();

    canvas.drawPath(path, yellowPaint);
    canvas.drawPath(path, orangeEdge);

    // Inner cavity with seeds
    final cavityPath = Path()
      ..moveTo(size.width * 0.35, size.height * 0.4)
      ..cubicTo(
        size.width * 0.25,
        size.height * 0.5,
        size.width * 0.3,
        size.height * 0.75,
        size.width * 0.55,
        size.height * 0.8,
      )
      ..cubicTo(
        size.width * 0.7,
        size.height * 0.75,
        size.width * 0.75,
        size.height * 0.55,
        size.width * 0.55,
        size.height * 0.38,
      )
      ..close();

    canvas.drawPath(cavityPath, seedArea);

    // Seeds
    final seedOffsets = [
      Offset(size.width * 0.38, size.height * 0.52),
      Offset(size.width * 0.48, size.height * 0.5),
      Offset(size.width * 0.58, size.height * 0.55),
      Offset(size.width * 0.42, size.height * 0.65),
      Offset(size.width * 0.52, size.height * 0.68),
    ];
    for (final offset in seedOffsets) {
      canvas.drawOval(
        Rect.fromCenter(center: offset, width: 4.5, height: 2.5),
        seedPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class CarrotsIllustration extends StatelessWidget {
  const CarrotsIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(60, 50), painter: _CarrotsPainter());
  }
}

class _CarrotsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final orangePaint = Paint()..color = const Color(0xFFFFB319);
    final linePaint = Paint()
      ..color = const Color(0xFFD67F05)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.2;
    final greenTops = Paint()
      ..color = const Color(0xFF2E6B34)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.2
      ..strokeCap = StrokeCap.round;

    // Green tops (carrot greens)
    canvas.drawLine(
      Offset(size.width * 0.22, size.height * 0.38),
      Offset(size.width * 0.12, size.height * 0.2),
      greenTops,
    );
    canvas.drawLine(
      Offset(size.width * 0.22, size.height * 0.38),
      Offset(size.width * 0.18, size.height * 0.14),
      greenTops,
    );
    canvas.drawLine(
      Offset(size.width * 0.38, size.height * 0.35),
      Offset(size.width * 0.34, size.height * 0.14),
      greenTops,
    );
    canvas.drawLine(
      Offset(size.width * 0.38, size.height * 0.35),
      Offset(size.width * 0.45, size.height * 0.18),
      greenTops,
    );

    // Carrot 1 (back)
    final carrot1 = Path()
      ..moveTo(size.width * 0.25, size.height * 0.36)
      ..lineTo(size.width * 0.42, size.height * 0.42)
      ..lineTo(size.width * 0.58, size.height * 0.88)
      ..lineTo(size.width * 0.28, size.height * 0.52)
      ..close();
    canvas.drawPath(carrot1, orangePaint);

    // Carrot 2 (front)
    final carrot2 = Path()
      ..moveTo(size.width * 0.32, size.height * 0.36)
      ..lineTo(size.width * 0.52, size.height * 0.46)
      ..lineTo(size.width * 0.78, size.height * 0.94)
      ..lineTo(size.width * 0.36, size.height * 0.56)
      ..close();
    canvas.drawPath(carrot2, orangePaint);
    canvas.drawPath(carrot2, linePaint);

    // Carrot grooves
    canvas.drawLine(
      Offset(size.width * 0.40, size.height * 0.48),
      Offset(size.width * 0.47, size.height * 0.51),
      linePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.48, size.height * 0.60),
      Offset(size.width * 0.55, size.height * 0.63),
      linePaint,
    );
    canvas.drawLine(
      Offset(size.width * 0.58, size.height * 0.74),
      Offset(size.width * 0.64, size.height * 0.77),
      linePaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BroccoliIllustration extends StatelessWidget {
  const BroccoliIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(60, 50), painter: _BroccoliPainter());
  }
}

class _BroccoliPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final crownColor = const Color(0xFF8B9E4B);
    final darkCrownColor = const Color(0xFF6E8033);
    final stemColor = const Color(0xFFAAB878);

    // Stem
    final stemPath = Path()
      ..moveTo(size.width * 0.42, size.height * 0.65)
      ..lineTo(size.width * 0.40, size.height * 0.95)
      ..quadraticBezierTo(
        size.width * 0.5,
        size.height * 0.98,
        size.width * 0.60,
        size.height * 0.95,
      )
      ..lineTo(size.width * 0.58, size.height * 0.65)
      ..close();
    canvas.drawPath(stemPath, Paint()..color = stemColor);

    // Broccoli florets cluster
    final clusters = [
      Offset(size.width * 0.5, size.height * 0.35),
      Offset(size.width * 0.35, size.height * 0.45),
      Offset(size.width * 0.65, size.height * 0.45),
      Offset(size.width * 0.28, size.height * 0.6),
      Offset(size.width * 0.72, size.height * 0.6),
      Offset(size.width * 0.45, size.height * 0.55),
      Offset(size.width * 0.55, size.height * 0.55),
    ];

    for (int i = 0; i < clusters.length; i++) {
      final color = i % 2 == 0 ? crownColor : darkCrownColor;
      canvas.drawCircle(clusters[i], 12.0, Paint()..color = color);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class BellPepperIllustration extends StatelessWidget {
  const BellPepperIllustration({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(size: const Size(60, 50), painter: _BellPepperPainter());
  }
}

class _BellPepperPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final yellowPaint = Paint()..color = const Color(0xFFFFCA28);
    final yellowEdge = Paint()
      ..color = const Color(0xFFE5A800)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.8;
    final redPaint = Paint()..color = const Color(0xFFE53935);
    final redInner = Paint()..color = const Color(0xFFFFCDD2);
    final stemPaint = Paint()..color = const Color(0xFF558B2F);

    // Green stem
    final stem = Path()
      ..moveTo(size.width * 0.28, size.height * 0.35)
      ..quadraticBezierTo(
        size.width * 0.3,
        size.height * 0.15,
        size.width * 0.36,
        size.height * 0.18,
      )
      ..lineTo(size.width * 0.34, size.height * 0.36)
      ..close();
    canvas.drawPath(stem, stemPaint);

    // Yellow whole bell pepper (left)
    final yellowBody = Path()
      ..moveTo(size.width * 0.2, size.height * 0.35)
      ..cubicTo(
        size.width * 0.08,
        size.height * 0.45,
        size.width * 0.08,
        size.height * 0.8,
        size.width * 0.25,
        size.height * 0.9,
      )
      ..cubicTo(
        size.width * 0.35,
        size.height * 0.95,
        size.width * 0.45,
        size.height * 0.85,
        size.width * 0.45,
        size.height * 0.5,
      )
      ..cubicTo(
        size.width * 0.42,
        size.height * 0.35,
        size.width * 0.28,
        size.height * 0.32,
        size.width * 0.2,
        size.height * 0.35,
      )
      ..close();
    canvas.drawPath(yellowBody, yellowPaint);
    canvas.drawPath(yellowBody, yellowEdge);

    // Red sliced bell pepper (right)
    final redSlice = Path()
      ..moveTo(size.width * 0.52, size.height * 0.42)
      ..cubicTo(
        size.width * 0.42,
        size.height * 0.55,
        size.width * 0.44,
        size.height * 0.88,
        size.width * 0.6,
        size.height * 0.92,
      )
      ..cubicTo(
        size.width * 0.76,
        size.height * 0.95,
        size.width * 0.82,
        size.height * 0.65,
        size.width * 0.74,
        size.height * 0.45,
      )
      ..cubicTo(
        size.width * 0.68,
        size.height * 0.38,
        size.width * 0.58,
        size.height * 0.38,
        size.width * 0.52,
        size.height * 0.42,
      )
      ..close();
    canvas.drawPath(redSlice, redPaint);

    // Inner cavity of red slice
    final innerCavity = Path()
      ..moveTo(size.width * 0.56, size.height * 0.5)
      ..cubicTo(
        size.width * 0.5,
        size.height * 0.6,
        size.width * 0.52,
        size.height * 0.8,
        size.width * 0.62,
        size.height * 0.84,
      )
      ..cubicTo(
        size.width * 0.72,
        size.height * 0.82,
        size.width * 0.74,
        size.height * 0.65,
        size.width * 0.68,
        size.height * 0.52,
      )
      ..close();
    canvas.drawPath(innerCavity, redInner);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
