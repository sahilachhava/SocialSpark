package model;

import java.io.FileWriter;
import java.math.BigInteger;
import java.security.*;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import db.*;
import model.*;

public class Utility {
	public static ArrayList<User> friendRequestUsers = new ArrayList<User>();
	public static ArrayList<Integer> friendRequestIDs = new ArrayList<Integer>();
	public static ArrayList<Notification> allNotifications = new ArrayList<Notification>();
	public static HashMap<Integer, User> allUsers = new HashMap<Integer, User>();
	public static ArrayList<User> allUsersData = new ArrayList<User>();
	public static ArrayList<User> allFriends = new ArrayList<User>();
	public static ArrayList<Post> allPosts = new ArrayList<Post>();
	
	public static String getMd5(String msgToEncrypt) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] messageDigest = md.digest(msgToEncrypt.getBytes());
            BigInteger no = new BigInteger(1, messageDigest);
  
            String hashtext = no.toString(16);
            while (hashtext.length() < 32) {
                hashtext = "0" + hashtext;
            }
            return hashtext;
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }
	
	public static void fetchNeccesaryData(int userID, UserDB userDB, HttpSession session, String dataJsonPath) throws Exception {
		
		//Fetching Friend Requests
		friendRequestUsers.removeAll(friendRequestUsers);
		friendRequestIDs = userDB.getFriendRequestIDs(userID);
		if(friendRequestIDs.size() > 0) {
			for(Integer uID : friendRequestIDs) {
				friendRequestUsers.add(userDB.getUser(uID));
			}
		}
		session.setAttribute("friendRequests", friendRequestUsers);
		
		//Fetching Notifications
		allNotifications = userDB.fetchNotification(userID);
		session.setAttribute("notifications", allNotifications);
		
		//Fetching Friends
		allFriends = userDB.fetchFriends(userID);
		session.setAttribute("allFriends", allFriends);
		
		//Fetching Posts
		allPosts = userDB.getAllPosts();
		session.setAttribute("allPosts", allPosts);
		
		//Fetching All User Data
		allUsersData.removeAll(allUsersData);
		allUsers = userDB.getAllUsers();
		for(User u : allUsers.values()) {
			allUsersData.add(u);
		}
		session.setAttribute("allUsers", allUsersData);
		String fileData = "var tipuedrop = {\"pages\": [";
		for(Integer key : allUsers.keySet()) {
			User user = allUsers.get(key);
			if(user.getUserID() != userID) {
				fileData += "{"
						+ "\"title\": \"" + user.getfName() + " " + user.getlName() + "\","
						+ "\"thumb\": \"" + user.getPhoto() + "\","
						+ "\"text\": \"<small>" + user.getBio() + " </small>\","
						+ "\"url\": \"./UserProfile?userID=" + user.getUserID() + "\""
						+ "},";
			}
		}
		fileData = fileData.substring(0, fileData.length() - 1);
		fileData += "]};";
		FileWriter file = new FileWriter(dataJsonPath);
		file.write(fileData);
		file.close();
	}
}
