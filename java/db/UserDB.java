package db;

import java.sql.*;

import java.util.*;

import javax.sql.*;

import org.json.simple.*;

import model.*;

public class UserDB {
	private DataSource dbConfig = null;
	
	public UserDB(DataSource dbConfig) {
		this.dbConfig = dbConfig;
	}
	
	public boolean registerUser(String fName, String lName, String photo, String email, String phone, String password) throws Exception {
		 Connection conn = null;
		 PreparedStatement ps = null;
		
		String insertQuery = "insert into users(userFName, userLName, userPhoto, userEmail, userPhone, userPassword)"
				+ "values(?,?,?,?,?,?)";
		
		try {
			conn = this.dbConfig.getConnection();
			ps = conn.prepareStatement(insertQuery);
			
			ps.setString(1, fName);
			ps.setString(2, lName);
			ps.setString(3, photo);
			ps.setString(4, email);
			ps.setString(5, phone);
			ps.setString(6, password);
			
			ps.executeUpdate();
			return true;
			
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public int loginUser(String email, String pass) throws Exception {
		Connection conn = null;
		Statement st = null;
		ResultSet res = null;
		
		String searchQuery = "select * from users";
		
		try {
			conn = this.dbConfig.getConnection();
			st = conn.createStatement();
			res = st.executeQuery(searchQuery);
			
			while(res.next()) {
				if(res.getString("userEmail").equals(email) && res.getString("userPassword").equals(pass)) {
					return res.getInt("userID");
				}
			}
			return -1;
		} finally {
			closeConnection(conn, st, null, res);
		}
	}
	
	public User getUser(int userID) throws Exception {
		Connection conn = null;
		Statement st = null;
		ResultSet res = null;
		
		String searchQuery = "select * from users where userID = " + userID;
		User user = null;
		try {
			conn = this.dbConfig.getConnection();
			st = conn.createStatement();
			res = st.executeQuery(searchQuery);
			
			while(res.next()) {
				user  = new User(
					res.getInt("userID"),
					res.getString("userFName"),
					res.getString("userLName"),
					res.getString("userPhoto"),
					res.getString("userEmail"),
					res.getString("userPhone"),
					res.getString("userBio"),
					res.getString("userCity"),
					res.getString("userCountry")
				);
				
				return user;
			}
			return user;
		} finally {
			closeConnection(conn, st, null, res);
		}
	}
	
	public HashMap<Integer, User> getAllUsers() throws Exception {
		Connection conn = null;
		Statement st = null;
		ResultSet res = null;
		
		HashMap<Integer, User> allUsers = new HashMap<Integer, User>();
		String searchQuery = "select * from users";
		
		try {
			conn = this.dbConfig.getConnection();
			st = conn.createStatement();
			res = st.executeQuery(searchQuery);
			
			while(res.next()) {
				allUsers.put(
					res.getInt("userID"), 
					new User(
						res.getInt("userID"),
						res.getString("userFName"),
						res.getString("userLName"),
						res.getString("userPhoto"),
						res.getString("userEmail"),
						res.getString("userPhone"),
						res.getString("userBio"),
						res.getString("userCity"),
						res.getString("userCountry")
					)
				);
			}
			
			return allUsers;
			
		} finally {
			closeConnection(conn, st, null, res);
		}
	}
	
	public boolean updateUser(int userID, String fName, String lName, String photo, String email, String phone, String bio, String city,
			String country) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String updateQuery = "update users set userFName = ?, userLName = ?, userPhoto = ?, "
				+ "userEmail = ?, userPhone = ?, userBio = ?, userCity = ?, userCountry = ? where userID = ?";
		
		try {
			conn = this.dbConfig.getConnection();
			ps = conn.prepareStatement(updateQuery);
			
			ps.setString(1, fName);
			ps.setString(2, lName);
			ps.setString(3, photo);
			ps.setString(4, email);
			ps.setString(5, phone);
			ps.setString(6, bio);
			ps.setString(7, city);
			ps.setString(8, country);
			ps.setInt(9, userID);
			
			ps.executeUpdate();
			
			return true;
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public boolean manageUser(int currentUserID, int friendID, int requestType) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String insertQuery = "insert into friends(userID, friendID, status) values(?,?,?)";
		String updateQuery = "update friends set status = ? where "
						+ "(userID = ? or userID = ?) and (friendID = ? or friendID = ?)";
		String deleteQuery = "delete from friends where " 
						+ "(userID = ? or userID = ?) and (friendID = ? or friendID = ?)";
		
		try {
			conn = this.dbConfig.getConnection();
			
			if(requestType == 0) { //request sent code block
				ps = conn.prepareStatement(insertQuery);
				
				ps.setInt(1, currentUserID);
				ps.setInt(2, friendID);
				ps.setInt(3, requestType);
				
				ps.executeUpdate();
				return true;
			} else if(requestType == 1) { //request accepted code block
				ps = conn.prepareStatement(updateQuery);
				
				ps.setInt(1, requestType);
				ps.setInt(2, currentUserID);
				ps.setInt(3, friendID);
				ps.setInt(4, friendID);
				ps.setInt(5, currentUserID);
				
				ps.executeUpdate();
				return true;
			} else if(requestType == 2) { //unfriend code block
				ps = conn.prepareStatement(deleteQuery);
				
				ps.setInt(1, currentUserID);
				ps.setInt(2, friendID);
				ps.setInt(3, friendID);
				ps.setInt(4, currentUserID);
				
				ps.executeUpdate();
				return true;
			} else if(requestType == -1) { //block friend code block
				ps = conn.prepareStatement(updateQuery);
				
				ps.setInt(1, requestType);
				ps.setInt(2, currentUserID);
				ps.setInt(3, friendID);
				ps.setInt(4, friendID);
				ps.setInt(5, currentUserID);
				
				ps.executeUpdate();
				return true;
			}
			
			return false;
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
							
	public int isFriend(int userID, int friendID) throws Exception {
		Connection conn = null;
		Statement st = null;
		ResultSet res = null;
		
		String searchQuery = "select * from friends where "
				+ "(userID = " + userID  
				+ " or userID = " + friendID + ")"
				+ "and (friendID = " + friendID 
				+ " or friendID = " + userID + ")";
		
		int friendStatus = -2;
		
		try {
			conn = this.dbConfig.getConnection();
			st = conn.createStatement();
			res = st.executeQuery(searchQuery);
			
			while(res.next()) {
				friendStatus = res.getInt("status");
				
				return friendStatus;
			}
			
			return friendStatus;
		} finally {
			closeConnection(conn, st, null, res);
		}
	}
	
	public ArrayList<Integer> getFriendRequestIDs(int userID) throws Exception {
		Connection conn = null;
		Statement st = null;
		ResultSet res = null;
		
		ArrayList<Integer> requestIDs = new ArrayList<Integer>();
		String searchQuery = "select * from friends where status = 0 and friendID = " + userID;
		
		try {
			conn = this.dbConfig.getConnection();
			st = conn.createStatement();
			res = st.executeQuery(searchQuery);
			
			while(res.next()) {
				requestIDs.add(res.getInt("userID"));
			}
			
			return requestIDs;
		}  finally {
			closeConnection(conn, st, null, res);
		}
	}
	
	public void sendNotification(int userID, int friendID, String nType) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String insertQuery = "insert into notifications(userID, friendID, nType) values(?,?,?)";
		
		try {
			conn = this.dbConfig.getConnection();
			ps = conn.prepareStatement(insertQuery);
			
			ps.setInt(1, userID);
			ps.setInt(2, friendID);
			ps.setString(3, nType);
			
			ps.executeUpdate();
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public ArrayList<Notification> fetchNotification(int userID) throws Exception {
		Connection conn = null;
		Statement st = null;
		ResultSet res = null;
		
		ArrayList<Notification> allNotifications = new ArrayList<Notification>();
		String searchQuery = "select * from notifications where userID = " + userID + " order by nTime desc";
		
		try {
			conn = this.dbConfig.getConnection();
			st = conn.createStatement();
			res = st.executeQuery(searchQuery);
			
			while(res.next()) {
				User user = getUser(res.getInt("friendID"));
				allNotifications.add(
					new Notification(
						res.getInt("nID"),
						res.getInt("userID"),
						res.getInt("friendID"),
						user,
						res.getString("nType"),
						res.getTimestamp("nTime")
					)
				);
			}
			
			return allNotifications;
		}  finally {
			closeConnection(conn, st, null, res);
		}
		
	}
	
	public ArrayList<User> fetchFriends(int userID) throws Exception {
		ArrayList<User> allFriends = new ArrayList<User>();
		HashMap<Integer, User> allUsers =  getAllUsers();
		
		for(Integer key : allUsers.keySet()) {
			User user = allUsers.get(key);
			if(isFriend(userID, user.getUserID()) == 1) {
				allFriends.add(user);
			}
		}
		
		return allFriends;
	}
	
	public boolean createPost(int userID, String postText, String postPhoto, boolean isMedia, boolean isVideo, int visibility) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String insertQuery = "insert into posts(userID, postText, postPhoto, isMedia, isVideo, postVisibility) "
				+ "values(?,?,?,?,?,?)";
		
		try {
			conn = this.dbConfig.getConnection();
			ps = conn.prepareStatement(insertQuery);
			
			ps.setInt(1, userID);
			ps.setString(2, postText);
			ps.setString(3, postPhoto);
			ps.setBoolean(4, isMedia);
			ps.setBoolean(5, isVideo);
			ps.setInt(6, visibility);
			
			ps.executeUpdate();
			return true;
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public ArrayList<Post> getAllPosts() throws Exception {
		Connection conn = null;
		Statement st = null;
		ResultSet res = null;
		
		ArrayList<Post> allPosts = new ArrayList<Post>();
		String searchQuery = "select * from posts order by postDateTime desc";
		
		try {
			conn = this.dbConfig.getConnection();
			st = conn.createStatement();
			res = st.executeQuery(searchQuery);
			
			while(res.next()) {
				User user = getUser(res.getInt("userID"));
				ArrayList<Integer> likeIDs = getLikes(res.getInt("postID"));
				ArrayList<Integer> saveIDs = getSaves(res.getInt("postID"));
				
				allPosts.add(
					new Post(
						res.getInt("postID"),
						res.getInt("userID"),
						user,
						res.getString("postText"),
						res.getString("postPhoto"),
						res.getTimestamp("postDateTime"),
						res.getBoolean("isMedia"),
						res.getBoolean("isVideo"),
						res.getInt("postVisibility"),
						likeIDs,
						saveIDs
					)
				);
			}
			
			return allPosts;
			
		} finally {
			closeConnection(conn, st, null, res);
		}
	}
	
	public boolean likePost(int userID, int postID, int actionStatus) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String insertQuery = "insert into likes(postID, userID) values(?,?)";
		String deleteQuery = "delete from likes where postID = ? and userID = ?";
		
		try {
			conn = this.dbConfig.getConnection();
			
			if(actionStatus == 1) { //1 means post liked by user
				ps = conn.prepareStatement(insertQuery);
				
				ps.setInt(1, postID);
				ps.setInt(2, userID);
				
				ps.executeUpdate();
			} else { //or else post is disliked by user
				ps = conn.prepareStatement(deleteQuery);
				
				ps.setInt(1, postID);
				ps.setInt(2, userID);
				
				ps.executeUpdate();
			}
			
			return true;
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public boolean savePost(int userID, int postID, int actionStatus) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String insertQuery = "insert into saves(postID, userID) values(?,?)";
		String deleteQuery = "delete from saves where postID = ? and userID = ?";
		
		try {
			conn = this.dbConfig.getConnection();
			
			if(actionStatus == 1) { //1 means post saved by user
				ps = conn.prepareStatement(insertQuery);
				
				ps.setInt(1, postID);
				ps.setInt(2, userID);
				
				ps.executeUpdate();
			} else { //or else post is unsaved by user
				ps = conn.prepareStatement(deleteQuery);
				
				ps.setInt(1, postID);
				ps.setInt(2, userID);
				
				ps.executeUpdate();
			}
			
			return true;
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public ArrayList<Integer> getLikes(int postID) throws Exception {
		Connection conn = null;
		Statement st = null;
		ResultSet res = null;
		
		ArrayList<Integer> likeUserIDs = new ArrayList<Integer>();
		String searchQuery = "select * from likes where postID = " + postID;
		
		try {
			conn = this.dbConfig.getConnection();
			st = conn.createStatement();
			res = st.executeQuery(searchQuery);
			
			while(res.next()) {
				likeUserIDs.add(res.getInt("userID"));
			}
			
			return likeUserIDs;
		} finally {
			closeConnection(conn, st, null, res);
		}
	}
	
	public ArrayList<Integer> getSaves(int postID) throws Exception {
		Connection conn = null;
		Statement st = null;
		ResultSet res = null;
		
		ArrayList<Integer> saveUserIDs = new ArrayList<Integer>();
		String searchQuery = "select * from saves where postID = " + postID;
		
		try {
			conn = this.dbConfig.getConnection();
			st = conn.createStatement();
			res = st.executeQuery(searchQuery);
			
			while(res.next()) {
				saveUserIDs.add(res.getInt("userID"));
			}
			
			return saveUserIDs;
		} finally {
			closeConnection(conn, st, null, res);
		}
	}
	
	public boolean deletePost(int postID) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String deleteQuery = "delete from posts where postID = ?";
		
		try {
			conn = this.dbConfig.getConnection();
			ps = conn.prepareStatement(deleteQuery);
			
			ps.setInt(1, postID);
			
			ps.executeUpdate();
			return true;
			
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public boolean updatePost(int postID, String updatedText) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String updateQuery = "update posts set postText = ? where postID = ?";
		
		try {
			conn = this.dbConfig.getConnection();
			ps = conn.prepareStatement(updateQuery);
			
			ps.setString(1, updatedText);
			ps.setInt(2, postID);
			
			ps.executeUpdate();
			return true;
			
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public boolean changePostVisibility(int postID, int actionStatus) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String updateQuery = "update posts set postVisibility = ? where postID = ?";
		
		try {
			conn = this.dbConfig.getConnection();
			ps = conn.prepareStatement(updateQuery);
			
			ps.setInt(1, actionStatus);
			ps.setInt(2, postID);
			
			ps.executeUpdate();
			return true;
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public int updatePassword(int userID, String oldPass, String newPass) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String updateQuery = "update users set userPassword = ? where userID = ? and userPassword = ?";
		
		try {
			conn = this.dbConfig.getConnection();
			ps = conn.prepareStatement(updateQuery);
			
			ps.setString(1, newPass);
			ps.setInt(2, userID);
			ps.setString(3, oldPass);
			
			return ps.executeUpdate();
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public void clearAccountData(int userID) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String deletePostsQuery = "delete from posts where userID = ?";
		String deleteFriendsQuery = "delete from friends where userID = ? or friendID = ?";
		String deleteLikesQuery = "delete from likes where userID = ?";
		String deleteSavesQuery = "delete from saves where userID = ?";
		String deleteNotificationsQuery = "delete from notifications where userID = ? or friendID = ?";
		
		try {
			conn = this.dbConfig.getConnection();
			
			//Deleting Posts
			ps = conn.prepareStatement(deletePostsQuery);
			ps.setInt(1, userID);
			ps.executeUpdate();
			ps.close();
			
			//Deleting Friends
			ps = conn.prepareStatement(deleteFriendsQuery);
			ps.setInt(1, userID);
			ps.setInt(2, userID);
			ps.executeUpdate();
			ps.close();
			
			//Deleting Likes
			ps = conn.prepareStatement(deleteLikesQuery);
			ps.setInt(1, userID);
			ps.executeUpdate();
			ps.close();
			
			//Deleting Saves
			ps = conn.prepareStatement(deleteSavesQuery);
			ps.setInt(1, userID);
			ps.executeUpdate();
			ps.close();
			
			//Deleting Notifications
			ps = conn.prepareStatement(deleteNotificationsQuery);
			ps.setInt(1, userID);
			ps.setInt(2, userID);
			ps.executeUpdate();
			
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	public void deleteAccount(int userID) throws Exception {
		Connection conn = null;
		PreparedStatement ps = null;
		
		String deleteQuery = "delete from users where userID = ?";
		
		try {
			conn = this.dbConfig.getConnection();
			
			//Deleting Posts
			ps = conn.prepareStatement(deleteQuery);
			ps.setInt(1, userID);
			ps.executeUpdate();
		} finally {
			closeConnection(conn, null, ps, null);
		}
	}
	
	private void closeConnection(Connection conn, Statement st, PreparedStatement ps, ResultSet res) {	
		try {
			if(conn != null) {
				conn.close();
			}
			if(st != null) {
				st.close();
			}
			if(ps != null) {
				ps.close();
			}
			if(res != null) {
				res.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
}
