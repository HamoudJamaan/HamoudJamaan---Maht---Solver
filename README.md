# HamoudJamaan---Maht---Solver
حل أسئلة الرياضيات المكتوبة بالرموز العربية 
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() => runApp(HamoudMathApp());

class HamoudMathApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hamoud Jumaan Arabic Maths',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Arial'),
      home: WelcomeScreen(),
    );
  }
}

// --- شاشة الترحيب ---
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0D3B66),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 160, height: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                image: DecorationImage(image: AssetImage('assets/icon.png'), fit: BoxFit.cover),
              ),
            ),
            SizedBox(height: 25),
            Text("Hamoud Jumaan Arabic Maths", style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            Text("( الرياضيات هي اللغة التي كتب بها الكون )", style: TextStyle(color: Colors.white70, fontSize: 15)),
            SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.amber, padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15)),
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ActivationScreen())),
              child: Text("ابدأ الرحلة التعليمية", style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }
}

// --- شاشة التفعيل ---
class ActivationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("تفعيل المنصة"), backgroundColor: Color(0xFF0D3B66)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text("يرجى إدخال رمز التفعيل للدخول إلى المنصة التعليمية:"),
            SizedBox(height: 30),
            TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: "كود التفعيل")),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage())), 
              child: Text("تفعيل ودخول")
            ),
            Spacer(),
            Text("لطلب الكود تواصل مع الأستاذ حمود:"),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(icon: Icon(Icons.chat, color: Colors.green), onPressed: () => launchUrl(Uri.parse("https://wa.me/967778870511"))),
                IconButton(icon: Icon(Icons.email, color: Colors.red), onPressed: () => launchUrl(Uri.parse("mailto:HamoudJumaan@gmail.com"))),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// --- الصفحة الرئيسية (نظام التبويبات الجديد) ---
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    MathSolverTab(),     // تبويب حل المسائل
    VideoLessonsTab(),   // تبويب دروس الفيديو
    LibraryTab(),        // تبويب المكتبة (PDF)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'حل المسائل'),
          BottomNavigationBarItem(icon: Icon(Icons.play_circle_fill), label: 'دروس فيديو'),
          BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'المكتبة'),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: (index) => setState(() => _selectedIndex = index),
      ),
    );
  }
}

// --- 1. تبويب حل المسائل (لوحة المفاتيح العربية) ---
class MathSolverTab extends StatelessWidget {
  final List<String> symbols = ['≤', '≥', '<', '>', '√', '∫', '∫_□', 'نهـ', 'نهـ+', '∛', 'ء/ءس', 'ء/ءص', 'لوهـ', 'نهـ-', '∜', 'ن ل ر', 'ن ق ك', 'لو', 'ل_□', '^', 'هـ', 'هـ^س', 'ت', '∞', 'C'];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(title: Text("المحلل الذكي"), backgroundColor: Color(0xFF0D3B66)),
        Expanded(child: Container(alignment: Alignment.bottomRight, padding: EdgeInsets.all(20), child: Text("٠", style: TextStyle(fontSize: 40)))),
        Container(
          height: 300, color: Colors.grey[200],
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
            itemCount: symbols.length,
            itemBuilder: (context, i) => Card(child: Center(child: Text(symbols[i], style: TextStyle(fontWeight: FontWeight.bold)))),
          ),
        ),
        Container(width: double.infinity, child: ElevatedButton(onPressed: () {}, child: Text("حل بالذكاء الاصطناعي"), style: ElevatedButton.styleFrom(backgroundColor: Colors.amber))),
      ],
    );
  }
}

// --- 2. تبويب دروس الفيديو ---
class VideoLessonsTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("دروس الفيديو التعليمية"), backgroundColor: Color(0xFF0D3B66)),
      body: ListView(
        children: [
          _videoTile("شرح التفاضل - الدرس الأول", "قناة الأستاذ حمود التعليمية"),
          _videoTile("حساب النهايات بالرموز العربية", "سلسلة احتراف الرياضيات"),
        ],
      ),
    );
  }

  Widget _videoTile(String title, String sub) {
    return ListTile(
      leading: Icon(Icons.play_circle_outline, color: Colors.red, size: 40),
      title: Text(title),
      subtitle: Text(sub),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: () => launchUrl(Uri.parse("https://www.youtube.com/@YourChannel")), // ضع رابط قناتك هنا
    );
  }
}

// --- 3. تبويب المكتبة (PDF) ---
class LibraryTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("مكتبة الملفات (PDF)"), backgroundColor: Color(0xFF0D3B66)),
      body: GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(10),
        children: [
          _pdfCard("ملخص الجبر"),
          _pdfCard("كتاب التمارين"),
        ],
      ),
    );
  }

  Widget _pdfCard(String title) {
    return Card(
      elevation: 4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.picture_as_pdf, size: 50, color: Colors.red),
          SizedBox(height: 10),
          Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
