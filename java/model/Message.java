package model;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class Message {
	private int senderID;
	private int receiverID;
	User sender;
	User receiver;
	private String msgText;
	private Timestamp msgTime;
	
	public Message(int senderID, int receiverID, User sender, User receiver, String msgText, Timestamp msgTime) {
		this.senderID = senderID;
		this.receiverID = receiverID;
		this.sender = sender;
		this.receiver = receiver;
		this.msgText = msgText;
		this.msgTime = msgTime;
	}
	
	public String getTime() {
		SimpleDateFormat dateFormat = new SimpleDateFormat("h:mm a");
		String time = dateFormat.format(this.msgTime);
		return time;
	}

	public int getSenderID() {
		return senderID;
	}

	public void setSenderID(int senderID) {
		this.senderID = senderID;
	}

	public int getReceiverID() {
		return receiverID;
	}

	public void setReceiverID(int receiverID) {
		this.receiverID = receiverID;
	}

	public User getSender() {
		return sender;
	}

	public void setSender(User sender) {
		this.sender = sender;
	}

	public User getReceiver() {
		return receiver;
	}

	public void setReceiver(User receiver) {
		this.receiver = receiver;
	}

	public String getMsgText() {
		return msgText;
	}

	public void setMsgText(String msgText) {
		this.msgText = msgText;
	}

	public Timestamp getMsgTime() {
		return msgTime;
	}

	public void setMsgTime(Timestamp msgTime) {
		this.msgTime = msgTime;
	}
}
