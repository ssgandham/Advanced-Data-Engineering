import java.util.LinkedList;
import java.util.Queue;
import java.util.Stack;

class Graph {
    static int V; // No. of vertices
    static float delta[], CB[];
    // Array  of lists for Adjacency List Representation
    static LinkedList<Integer> adj[];

    static LinkedList<Integer> pred[];
    Stack<Integer> st = new Stack<Integer>();
    static int sigma[], dist[];
    Queue<Integer> q = new LinkedList<Integer>();

    // Constructor
    Graph(int v) {
        V = v;
        adj = new LinkedList[v];
        pred = new LinkedList[v];
        CB = new float[v];
        sigma = new int[v];
        dist = new int[v];
        delta = new float[v];
        for (int i = 0; i < v; ++i) {
            adj[i] = new LinkedList<Integer>();
            pred[i] = new LinkedList<Integer>();
            sigma[i] = 0;
            dist[i] = -1;
            CB[i] = 0;
            delta[i] = 0;

        }
        dist[1] = 0;
        sigma[1] = 1;

    }

    public void edge_add(int src, int dest) {
        adj[src].add(dest);
    }

    public void init(int src) {
        //        adj = new LinkedList[V];
        pred = new LinkedList[V];
        //        CB = new float[V];
        sigma = new int[V];
        dist = new int[V];
        delta = new float[V];
        for (int i = 0; i < V; ++i) {
            // adj[i] = new LinkedList<Integer>();
            pred[i] = new LinkedList<Integer>();
            sigma[i] = 0;
            dist[i] = -1;

            delta[i] = 0;

        }
        dist[src] = 0;
        sigma[src] = 1;
    }

    public void traverse() {
        for (int i = 0; i < V; i++) {
            int src = i;
            init(src);
            st = new Stack<Integer>();
            //            dist[src] = 0;
            //            sigma[src] = 1;
            q.add(src);
            while (!q.isEmpty()) {
                int vertex = q.poll();
                st.push(vertex);
                for (int neigh : adj[vertex]) {
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
                    float tmp_delta = delta[vertice]
                            + (((float) ((float) sigma[vertice] / (float) sigma[st_tmp])) * (1 + delta[st_tmp]));
                    delta[vertice] += tmp_delta;
                    if (src != st_tmp)
                        CB[st_tmp] += delta[st_tmp];
                }
            }
            //            System.out.println("i :" + i);

        }
        for (float cb_tmp : CB)
            System.out.println(cb_tmp);
    }

    public static void main(String[] args) {
        // TODO Auto-generated method stub
        Graph graph = new Graph(6);
        graph.edge_add(0, 1);
        graph.edge_add(0, 2);
        graph.edge_add(1, 0);
        graph.edge_add(1, 3);
        graph.edge_add(2, 0);
        graph.edge_add(2, 3);
        graph.edge_add(2, 4);
        graph.edge_add(2, 5);
        graph.edge_add(3, 1);
        graph.edge_add(3, 2);
        graph.edge_add(4, 2);
        graph.edge_add(4, 5);
        graph.edge_add(5, 2);
        graph.edge_add(5, 4);
        graph.traverse();

        for (LinkedList<Integer> tmp : pred) {

            //            System.out.println(tmp);

        }

    }

}
