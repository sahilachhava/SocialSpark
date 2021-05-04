package model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class Post {
	private int postID;
	private int userID;
	private User user;
	private String postText;
	private String postPhoto;
	private Timestamp postTime;
	private boolean isMedia;
	private boolean isVideo;
	private int visibility;
	private ArrayList<Integer> userLikes;
	private ArrayList<Integer> userSaves;
	
	public Post(int postID, int userID, User user, String postText, String postPhoto, Timestamp postTime,
			boolean isMedia, boolean isVideo, int visibility, ArrayList<Integer> userLikes, ArrayList<Integer> userSaves) {
		this.postID = postID;
		this.userID = userID;
		this.user = user;
		this.postText = postText;
		this.postPhoto = postPhoto;
		this.postTime = postTime;
		this.isMedia = isMedia;
		this.isVideo = isVideo;
		this.visibility = visibility;
		this.userLikes = userLikes;
		this.userSaves = userSaves;
	}
	
	public String getTime() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy h:mm a");
		String time = dateFormat.format(this.postTime);
		return time;
	}

	public int getUserID() {
		return userID;
	}

	public void setUserID(int userID) {
		this.userID = userID;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getPostText() {
		return postText;
	}

	public void setPostText(String postText) {
		this.postText = postText;
	}

	public String getPostPhoto() {
		return postPhoto;
	}

	public void setPostPhoto(String postPhoto) {
		this.postPhoto = postPhoto;
	}

	public Timestamp getPostTime() {
		return postTime;
	}

	public void setPostTime(Timestamp postTime) {
		this.postTime = postTime;
	}

	public boolean isMedia() {
		return isMedia;
	}

	public void setMedia(boolean isMedia) {
		this.isMedia = isMedia;
	}

	public boolean isVideo() {
		return isVideo;
	}

	public void setVideo(boolean isVideo) {
		this.isVideo = isVideo;
	}

	public int getVisibility() {
		return visibility;
	}

	public void setVisibility(int visibility) {
		this.visibility = visibility;
	}

	public int getPostID() {
		return postID;
	}

	public ArrayList<Integer> getUserLikes() {
		return userLikes;
	}

	public void setUserLikes(ArrayList<Integer> userLikes) {
		this.userLikes = userLikes;
	}

	public ArrayList<Integer> getUserSaves() {
		return userSaves;
	}

	public void setUserSaves(ArrayList<Integer> userSaves) {
		this.userSaves = userSaves;
	}
}
