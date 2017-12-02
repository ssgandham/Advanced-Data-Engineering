
import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.FileSystem;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import com.ibm.icu.util.StringTokenizer;

public class Graph_Hadoop {

    public static class TokenizerMapper extends Mapper<Object, Text, Text, Text> {

        public void map(Object key, Text value, Context context) throws InterruptedException {
            //            System.out.println("Values : " + value);

            StringTokenizer itr = new StringTokenizer(value.toString());
            String tmp_word = itr.nextToken();
            String tmp_destination = itr.nextToken();
            Text src = new Text();
            Text dest = new Text();
            //            System.out.println(tmp_word);
            //            System.out.println(tmp_destination);
            //            System.out.println(itr.nextToken());
            src.set(tmp_word);
            dest.set(tmp_destination);
            try {
                context.write(src, dest);
            } catch (IOException e) {

                e.printStackTrace();

            }

        }
    }

    public static class IntSumReducer extends Reducer<Text, Text, Text, Text> {

        public void reduce(Text key, Iterable<Text> values, Context context) throws InterruptedException {
            //            try {
            //                int sum = 0;
            for (Text val : values) {
                //                System.out.println("Key i :" + Integer.parseInt(key.toString()) + ":" + val);
                if (!Graph_Declare.adj[Integer.parseInt(key.toString())].contains(Integer.parseInt(val.toString())))
                    Graph_Declare.adj[Integer.parseInt(key.toString())].add(Integer.parseInt(val.toString()));
                //                System.out.println(Graph_Declare.adj[Integer.parseInt(key.toString())]);
                //                System.out.println("Key : " + key + "  Values:" + val);
                try {
                    context.write(key, val);
                } catch (IOException e) {

                    e.printStackTrace();
                }
            }

        }
    }

    public static void main(String[] args) throws Exception {
        System.out.println("Before going inside constructor");
        Graph_Declare graph = new Graph_Declare(7);
        System.out.println("check passed constructor");
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "word count");
        job.setJarByClass(Graph_Hadoop.class);
        job.setMapperClass(TokenizerMapper.class);
        job.setCombinerClass(IntSumReducer.class);
        job.setReducerClass(IntSumReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);
        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));
        Graph_Declare.traverse();
        System.out.println("Graph Traversed");
        //        for (LinkedList<Integer> tmp : pred) {
        //
        //            System.out.println(tmp);
        //            System.out.println("Went Inside");
        //
        //        }

        System.out.println("adj length " + Graph_Declare.adj.length);
        for (int i = 1; i < Graph_Declare.adj.length; i++) {
            System.out.println("adj i " + i + ":" + Graph_Declare.adj[i].size());
            for (int tmp : Graph_Declare.adj[i])
                System.out.println("Key i :" + i + tmp);
        }

        // configuration should contain reference to your namenode
        FileSystem fs = FileSystem.get(new Configuration());
        // true stands for recursively deleting the folder you gave
        fs.delete(new Path("/Users/balaji/Desktop/Workbook1"), true);

        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}