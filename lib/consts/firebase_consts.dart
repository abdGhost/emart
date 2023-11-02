import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth firebaseAuth = FirebaseAuth.instance;
FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

User? currentUser = firebaseAuth.currentUser;

//Collections
const userCollection = 'users';
const productCollection = 'products';
const cartCollection = 'cart';
const chatsCollection = 'chats';
const messagesCollection = 'messages';
const orderCollection = 'orders';
