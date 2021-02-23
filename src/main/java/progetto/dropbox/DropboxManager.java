package progetto.dropbox;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;

import com.dropbox.core.DbxRequestConfig;
import com.dropbox.core.v2.DbxClientV2;
import com.dropbox.core.v2.sharing.ListSharedLinksResult;
import com.dropbox.core.v2.sharing.SharedLinkMetadata;


public class DropboxManager {
	
	private static final String ACCESS_TOKEN = "3kKKuvFYXOoAAAAAAAAAAQS05636Spd9eWz0a-ETmbyl-0MaCSZ4yFe1rzVXZ_MB";
	private static DropboxManager instance = null;
	private DbxRequestConfig config;
	private DbxClientV2 client;
	
	private DropboxManager() {
		this.config = new DbxRequestConfig("dropbox/VIDEOVISION");
        this.client = new DbxClientV2(config, ACCESS_TOKEN);
	}
	
	public static DropboxManager getInstance() {
		if (instance == null)
			instance = new DropboxManager();
		return instance;
	}
	
	public void uploadVideo(String path, String nomeVideo) {
		try {
			File f = new File(path);
			InputStream in = new FileInputStream(f);
			client.files().uploadBuilder("/" + nomeVideo).uploadAndFinish(in);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String getLinkVideo(String nomeVideo) {
		StringBuilder c = new StringBuilder();
		try {
	        ListSharedLinksResult sh = client.sharing().listSharedLinksBuilder().withPath("/" + nomeVideo).start();
	        if(sh.getLinks().isEmpty()) {
	        	SharedLinkMetadata slm = client.sharing().createSharedLinkWithSettings("/" + nomeVideo); 
	        	c.append(slm.getUrl());
	        }
	        else {
	            for(SharedLinkMetadata slm : sh.getLinks())
	            	c.append(slm.getUrl());
	        }
	        c.setCharAt(c.length()-1,'1');
		} catch (Exception e) {
			e.printStackTrace();
		}
        return c.toString();
	}
}
