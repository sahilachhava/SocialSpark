package model;

public class User {
	private int userID;
	private String fName;
	private String lName;
	private String photo;
	private String email;
	private String phone;
	private String bio;
	private String city;
	private String country;
	
	public User(int userID, String fName, String lName, String photo, String email, String phone, String bio, String city,
			String country) {
		this.userID = userID;
		this.fName = fName;
		this.lName = lName;
		this.photo = photo;
		this.email = email;
		this.phone = phone == null ? "" : phone;
		this.bio = bio == null ? "" : bio;
		this.city = city == null ? "" : city;
		this.country = country == null ? "" : country;
	}

	public String getBio() {
		return bio;
	}

	public void setBio(String bio) {
		this.bio = bio;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPhoto() {
		return photo;
	}

	public void setPhoto(String photo) {
		this.photo = photo;
	}

	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public int getUserID() {
		return userID;
	}
}
