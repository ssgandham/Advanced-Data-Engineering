
import java.io.IOException;

import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.IntWritable;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

import com.ibm.icu.util.StringTokenizer;

public class HadoopTest {

    public static class TokenizerMapper extends Mapper<Object, Text, Text, Text> {

        private final static IntWritable one = new IntWritable(1);
        Text word = new Text();
        private Text dest = new Text();

        public void map(Object key, Text value, Context context) throws InterruptedException {
            System.out.println("Values : " + value);

            StringTokenizer itr = new StringTokenizer(value.toString());
            String tmp_word = itr.nextToken();
            String tmp_destination = itr.nextToken();
            System.out.println(tmp_word);
            System.out.println(tmp_destination);
            System.out.println(itr.nextToken());
            word.set(tmp_word);
            dest.set(tmp_destination);
            try {
                context.write(word, dest);
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();

            }
            //            System.out.println("Source : " + itr.nextToken());
            //            System.out.println("Destination : " + itr.nextToken());
            //            System.out.println("Weight : " + itr.nextToken());

            //            while (itr.hasMoreTokens()) {
            //
            //                try {
            //                    String tmp_word = itr.nextToken();
            //                    System.out.println(tmp_word);
            //                    word.set(tmp_word);
            //                    context.write(word, one);
            //                } catch (java.io.IOException e) {
            //                    // TODO Auto-generated catch block
            //                    e.printStackTrace();
            //                }
            //            }
        }
    }

    public static class IntSumReducer extends Reducer<Text, Text, Text, Text> {
        private IntWritable result = new IntWritable();

        public void reduce(Text key, Iterable<Text> values, Context context) throws InterruptedException {
            //            try {
            //                int sum = 0;
            for (Text val : values) {

                System.out.println("Key : " + key + "  Values:" + val);
                try {
                    context.write(key, val);
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            //                result.set(sum);
            //
            //                context.write(key, result);

            //            } catch (java.io.IOException e) {
            //                // TODO Auto-generated catch block
            //                e.printStackTrace();
            //            }
        }
    }

    public static void main(String[] args) throws Exception {
        Configuration conf = new Configuration();
        Job job = Job.getInstance(conf, "word count");
        job.setJarByClass(HadoopTest.class);
        job.setMapperClass(TokenizerMapper.class);
        job.setCombinerClass(IntSumReducer.class);
        job.setReducerClass(IntSumReducer.class);
        job.setOutputKeyClass(Text.class);
        job.setOutputValueClass(Text.class);
        FileInputFormat.addInputPath(job, new Path(args[0]));
        FileOutputFormat.setOutputPath(job, new Path(args[1]));
        System.exit(job.waitForCompletion(true) ? 0 : 1);
    }
}