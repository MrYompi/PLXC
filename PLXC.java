import java.io.FileReader;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Scanner;

public class PLXC {
	public static int tag=0;
	public static int tagC=0;
	public static int tmp=0;
	public static int as=0;
	public static String type="";
	public static HashMap<String, String> table = new HashMap<String, String>();
	public static HashMap<String,	String> variables = new HashMap<String, String>();
	public static HashSet<String> amb = new HashSet<String>();
	public static PrintStream out;
	public static void main(String argv[]) {
    try {
      Reader in = new InputStreamReader(System.in);
      out = System.out;
      if (argv.length>0) {
    	  in = new FileReader(argv[0]);
      }
      if (argv.length>1) {
    	  out = new PrintStream(new FileOutputStream(argv[1]));
      }
      parser p = new parser(new Yylex(in));
      Object result = p.parse().value;
    } catch (Exception e) {
      e.printStackTrace();
    }
  }
	public static String get(String s){
		String s1="";
		if(table.containsKey(s)){
			s1=table.get(s);
			table.remove(s);
		}
		return s1;
	}
	public static String head(String s){
		if (s==null){
			return "";
		}else{
			Scanner sc =new Scanner(s);
			sc.useDelimiter("=");
			return sc.next();
		}
	}
	public static void clearAmb(){
		for(String s:amb){
			table.remove(s);
		}
		amb.clear();
	}
}
