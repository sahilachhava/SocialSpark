package model;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.sql.*;

public class Notification {
	private int nID;
	private int userID;
	private int friendID;
	private User friend;
	private String nType;
	private Timestamp nTime;
	
	public Notification(int nID, int userID, int friendID, User friend, String nType, Timestamp time) {
		this.nID = nID;
		this.userID = userID;
		this.friendID = friendID;
		this.friend = friend;
		this.nType = nType;
		this.nTime = time;
	}
	
	public String getTime() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yy h:mm a");
		String time = dateFormat.format(this.nTime);
		return time;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public int getFriendID() {
		return friendID;
	}

	public void setFriendID(int friendID) {
		this.friendID = friendID;
	}

	public User getFriend() {
		return friend;
	}

	public void setFriend(User friend) {
		this.friend = friend;
	}

	public String getnType() {
		return nType;
	}

	public void setnType(String nType) {
		this.nType = nType;
	}

	public Timestamp getNTime() {
		return nTime;
	}

	public void setNTime(Timestamp time) {
		this.nTime = time;
	}

	public int getnID() {
		return nID;
	}	
}
