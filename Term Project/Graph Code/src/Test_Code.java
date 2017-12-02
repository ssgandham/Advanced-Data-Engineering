import java.io.FileNotFoundException;

public class Test_Code {

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        try {
            Online_Test test = new Online_Test(
                    "/Users/balaji/Documents/github/DataEngineering/Term Project/Graph Code/src/Test File2");
            test.calculateShortestPaths(1);
        } catch (FileNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

}
