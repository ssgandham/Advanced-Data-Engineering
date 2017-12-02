import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

public class Graph_Declare {

    static int V, CB[]; // No. of vertices
    static double delta[];
    // Array  of lists for Adjacency List Representation
    static LinkedList<Integer> adj[];

    static LinkedList<Integer> pred[];
    static Stack<Integer> st = new Stack<Integer>();
    static int sigma[], dist[];
    static Queue<Integer> q = new LinkedList<Integer>();
    static Graph_Hadoop graph;

    // Constructor
    Graph_Declare(int v) {
        V = v;
        adj = new LinkedList[v];

        pred = new LinkedList[v];
        CB = new int[v];
        sigma = new int[v];
        dist = new int[v];
        delta = new double[v];
        for (int i = 0; i < v; ++i) {
            adj[i] = new LinkedList<Integer>();
            System.out.println("Created new adj for : " + i);
            pred[i] = new LinkedList<Integer>();
            sigma[i] = 0;
            dist[i] = -1;
            CB[i] = 0;
            delta[i] = 0;

        }
        System.out.println("Distance");
        for (double cb_tmp : dist)
            System.out.println(cb_tmp);

        System.out.println("Sigma");
        for (double cb_tmp : sigma)
            System.out.println(cb_tmp);

        dist[1] = 0;
        sigma[1] = 1;

    }

    public static void edge_add(int src, int dest) {
        System.out.println("Added " + src + " to " + dest);
        adj[src].add(dest);
    }

    public static void traverse() {
        //        for (int i = 1; i < V; i++) {
        int src = 1;
        //            dist[src] = 0;
        //            sigma[src] = 1;
        q.add(src);
        System.out.println("Before going in the queue");
        while (!q.isEmpty()) {
            System.out.println("Went in the queue");
            int vertex = q.poll();
            System.out.println("Vertex is :" + vertex);
            st.push(vertex);
            for (int neigh : adj[vertex]) {
                System.out.println("vertex :" + vertex + "neigh : " + neigh);
                if (dist[neigh] < 0) {
                    q.add(neigh);
                    dist[neigh] = dist[vertex] + 1;
                }

                if (dist[neigh] == dist[vertex] + 1) {
                    sigma[neigh] = sigma[neigh] + sigma[vertex];
                    if (!pred[neigh].contains(vertex))
                        pred[neigh].add(vertex);
                }
            }

        }

        while (!st.isEmpty()) {
            int st_tmp = st.pop();
            for (int vertice : pred[st_tmp]) {
                System.out.println("vertice :" + st_tmp + "predecessor : " + vertice);
                double tmp_delta = delta[vertice] + ((sigma[vertice] / sigma[st_tmp]) * (1 + delta[st_tmp]));
                System.out.println("delta : " + delta);
                delta[vertice] = tmp_delta;
                if (src != st_tmp)
                    CB[st_tmp] += delta[st_tmp];
            }
        }
        //        System.out.println("i :" + i);
        for (double cb_tmp : CB)
            System.out.println(cb_tmp);

    }
    //    }

}
