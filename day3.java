import java.io.*;
import java.util.regex.*;

public class day3 {
    public static void main(String[] args) {
        String fn = args.length >= 1 ? args[0] : "input/3.in";
        StringBuilder sb = new StringBuilder();

        try (BufferedReader br = new BufferedReader(new FileReader(fn))) {
            String l;
            while ((l = br.readLine()) != null) sb.append(l);
        } catch (IOException e) {
            System.err.println("Could not open the file! " + e.getMessage());
            return;
        }

        String s = sb.toString();
        int p1 = 0;
        int p2 = 0;
        boolean ok = true;

        for (int i = 0; i < s.length(); i++) {
            if (s.startsWith("do()", i)) ok = true;
            if (s.startsWith("don't()", i)) ok = false;
            
            Pattern pattern = Pattern.compile("mul\\((\\d{1,3}),(\\d{1,3})\\)");
            Matcher matcher = pattern.matcher(s.substring(i));
            if (matcher.find() && matcher.start() == 0) {
                int x = Integer.parseInt(matcher.group(1));
                int y = Integer.parseInt(matcher.group(2));

                if (ok) p2 += x * y;
                p1 += x * y;
                i += matcher.end() - 1;
            }
        }

        System.out.println(p1);
        System.out.println(p2);
    }
}