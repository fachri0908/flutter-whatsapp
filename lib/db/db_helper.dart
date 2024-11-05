import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:whatsapp_clone/db/models/chat_item_model.dart';
import 'package:whatsapp_clone/db/models/user_chat_model.dart';
import './models/user_model.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database? _database;

  DatabaseHelper._privateConstructor();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'whatsapp.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        phoneNumber TEXT,
        status TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE contacts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        phoneNumber TEXT,
        status TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE chatItems(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        receiverId INTEGER,
        isFromMe INTEGER,
        sentTime BIGINT,
        isRead INTEGER,
        message TEXT
      )
    ''');
    await db.execute('''
      CREATE TABLE userChats(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        receiverId INTEGER,
        phoneNumber TEXT,
        name TEXT,
        lastMessage TEXT,
        lastMessageSentTime BIGINT,
        unreadCount INTEGER
      )
    ''');
  }

  Future<int> insertUser() async {
    Database db = await instance.database;
    return await db.insert('users', User(name: 'John Doe', phoneNumber: '082323232323').toMap());
  }

  Future<int> insertChat(int receiverId, String message) async {
    Database db = await instance.database;
    int currentUtcTimeInMillis = DateTime.now().toUtc().millisecondsSinceEpoch;
    return await db.insert('chatItems', ChatItem(
      receiverId: receiverId, 
      message: message,
      isFromMe: 1,
      isRead: 0,
      sentTime: currentUtcTimeInMillis
    ).toMap());
  }

  Future<int> insertUserChat(UserChat userChat, bool newChat) async {
    Database db = await instance.database;
    if(newChat) {
      return await db.insert('userChats', userChat.toMap());
    } else {
      return await db.update('userChats', userChat.toMap());
    }
  }

  Future<int> generateContacts() async {
    Database db = await instance.database;
    await db.insert('contacts', User(name: 'Alice Smith', phoneNumber: '083145617890').toMap());
    await db.insert('contacts', User(name: 'Bob Johnson', phoneNumber: '084156718901').toMap());
    await db.insert('contacts', User(name: 'Charlie Brown', phoneNumber: '085167819012').toMap());
    await db.insert('contacts', User(name: 'David Wilson', phoneNumber: '086178910123').toMap());
    await db.insert('contacts', User(name: 'Emma Taylor', phoneNumber: '087189011234').toMap());
    await db.insert('contacts', User(name: 'Frank Harris', phoneNumber: '088190112345').toMap());
    await db.insert('contacts', User(name: 'Grace Lee', phoneNumber: '089101213456').toMap());
    await db.insert('contacts', User(name: 'Henry Walker', phoneNumber: '080112314567').toMap());
    await db.insert('contacts', User(name: 'Ivy Young', phoneNumber: '081123415678').toMap());
    return 1;
  }

  Future<List<User>> getUsers() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  Future<List<ChatItem>> getChatItems(int receiverId) async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('''
      SELECT * from chatItems where receiverId=$receiverId
      ''');
    return List.generate(maps.length, (i) {
      return ChatItem.fromMap(maps[i]);
    });
  }

  Future<List<UserChat>> getUserChats() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * from userChats');
    return List.generate(maps.length, (i) {
      return UserChat.fromMap(maps[i]);
    });
  }

  Future<List<User>> getContacts() async {
    Database db = await instance.database;
    final List<Map<String, dynamic>> maps = await db.query('contacts');
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  Future<int> deleteUser(int id) async {
    Database db = await instance.database;
    return await db.delete('users', where: 'id = ?', whereArgs: [id]);
  }
}
