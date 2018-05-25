package Algorithm;
 

import java.math.BigInteger;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;


public class Algo {
 


	private String tokens;
	public BigInteger intSimHash;
	private String strSimHash;
	private int hashbits = 128;
 
        
        public Algo(String tokens) {
		this.tokens = tokens;
		this.intSimHash = this.simHash();
	}

	public Algo(String tokens, int hashbits) {
		this.tokens = tokens;
		this.hashbits = hashbits;
		this.intSimHash = this.simHash();
                //this.strSimHash=this.simHash();
	}

	
	
        
     
        
        
        
        public BigInteger simHash() {
	
		final int[] v = new int[this.hashbits];

		final StringTokenizer stringTokens = new StringTokenizer(this.tokens);
	
//		System.out.println("Token Count: " + stringTokens.countTokens());

		while (stringTokens.hasMoreTokens()) 
                {
			final String temp = stringTokens.nextToken();
			final BigInteger t = this.hash(temp);

			for (int i = 0; i < this.hashbits; i++) 
                        {
				final BigInteger bitmask = new BigInteger("1").shiftLeft(i);
				if (t.and(bitmask).signum() != 0) 
                                {
					v[i] += 1;
				} else {
					v[i] -= 1;
				}
			}
		}
		
		
      
                
                
                BigInteger fingerprint = new BigInteger("0");
		final StringBuffer simHashBuffer = new StringBuffer();
		for (int i = 0; i < this.hashbits; i++) 
                {
			if (v[i] >= 0)
                        {
				fingerprint = fingerprint.add(new BigInteger("1").shiftLeft(i));
				simHashBuffer.append("1");
			} 
                        else 
                        {
				simHashBuffer.append("0");
			}
		}
		this.strSimHash = simHashBuffer.toString();
		 
		return fingerprint;
	}

	
	
        
        
        
        
        
        private BigInteger hash(String source)
        {
		if (source == null || source.length() == 0) 
                {
			return new BigInteger("0");
		} else 
                {
			char[] sourceArray = source.toCharArray();
			BigInteger x = BigInteger.valueOf(((long) sourceArray[0]) << 7);
			BigInteger m = new BigInteger("1000003"); 
			BigInteger mask = new BigInteger("2").pow(this.hashbits).subtract(new BigInteger("1"));
			for (char item : sourceArray) 
                        {
				BigInteger temp = BigInteger.valueOf((long) item);
				x = x.multiply(m).xor(temp).and(mask);
			}
			x = x.xor(new BigInteger(String.valueOf(source.length())));
			if (x.equals(new BigInteger("-1"))) 
                        {
				x = new BigInteger("-2");
			}
			return x;
		}
	}

	
        
        
        
        
      
        
        
        
        public int hammingDistance(Algo other) 
        {
		BigInteger x = this.intSimHash.xor(other.intSimHash);
		int tot = 0;

		while (x.signum() != 0) {
			tot += 1;
			x = x.and(x.subtract(new BigInteger("1")));
		}
		return tot;
	}

	
        
        
        
        
        
        public int getDistance(String str1, String str2) 
        {
		int distance;
		if (str1.length() != str2.length())
                {
			distance = -1;
		} else 
                {
			distance = 0;
			for (int i = 0; i < str1.length(); i++) {
				if (str1.charAt(i) != str2.charAt(i)) {
					distance++;
				}
			}
		}
		return distance;
	}

 
        
        public List subByDistance(Algo simHash, int distance) 
        {
		int numEach = this.hashbits / (distance + 1);
		List characters = new ArrayList();

		StringBuffer buffer = new StringBuffer();

		int k = 0;
		for (int i = 0; i < this.intSimHash.bitLength(); i++)
                {
			boolean sr = simHash.intSimHash.testBit(i);

			if (sr) 
                        {
				buffer.append("1");
			} else 
                        {
				buffer.append("0");
			}

			if ((i + 1) % numEach == 0) {
				BigInteger eachValue = new BigInteger(buffer.toString(), 2);
				 
				buffer.delete(0, buffer.length());
				characters.add(eachValue);
			}
		}

		return characters;
	}

 


/*public static void main(String[] args)  {
     String x="this is test string";
     String y="this is test";
     Algo ob=new Algo(x);
    // BigInteger c=ob.intSimHash();
     //List count;
     //count=ob.subByDistance(ob,25);
     //System.out.println(count);
     Algo ob1=new Algo(y);
     BigInteger count1=ob1.simHash();
    System.out.println(count1);
}*/
}


