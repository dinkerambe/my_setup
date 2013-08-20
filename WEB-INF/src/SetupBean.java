
public class SetupBean{
	
	private long setupID;
	private String setupID_str;
	private String title;
	private String description;
	private int likes;
	private int flags;

	public SetupBean(){}
	public SetupBean(long setupID, String title, String description, int likes, int flags){
		this.setupID = setupID;
		this.title = title;
		this.description = description;
		this.likes = likes;
		this.flags = flags;

		setSetupID_str();
	}

	public SetupBean(long setupID, String title){
		this.setupID = setupID;
		this.title = title;
	}

	public void setSetupID(long setupID){
		this.userID = userID;
		setUserID_str();
	}
	
	//solution to long not being able to store 64bit unsigned ints
	public void setSetupID_str(){
		final BigInteger TWO_64 = BigInteger.ONE.shiftLeft(64);
		BigInteger b = BigInteger.valueOf(this.setupID);
		if(b.signum() < 0)
			b=b.add(TWO_64);
		setupID_str = b.toString();	
	}

	public void setSetupID(long setupID){
		this.setupID = setupID;
	}
	public void setTitle(String title){
		this.title = title;
	}
	public void setDescription(String description){
		this.description = description;
	}
	public void setLikes(int likes){
		this.likes = likes;
	}
	public void setFlag(int flags){
		this.flags=flags;
	}

	public long getSetupID(){
		return setupID;
	}
	public String getSetupID_str(){
		return setupID_str;
	}
	public String getTitle(){
		return title;
	}
	public String getDescription(){
		return description;
	}
	public int getLikes(){
		return likes;
	}
	public int getFlags(){
		return flags;
	}
}
