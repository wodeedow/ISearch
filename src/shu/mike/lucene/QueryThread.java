package shu.mike.lucene;

import java.io.BufferedInputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.net.Socket;
import java.util.concurrent.ArrayBlockingQueue;
import java.util.concurrent.TimeUnit;

public class QueryThread extends Thread {

	private Socket[] sockets = null;
	private int index = 0;
	private ArrayBlockingQueue<DocumentS[]> queue = null;

	public QueryThread(ArrayBlockingQueue<DocumentS[]> queue, Socket[] sockets,
			int index) {
		this.queue = queue;
		this.sockets = sockets;
		this.index = index;
	}

	public void run() {
		ObjectInputStream objis;
		try {
			objis = new ObjectInputStream(new BufferedInputStream(
					sockets[index].getInputStream()));
			Object obj;
			try {
				obj = objis.readObject();
				DocumentS[] docss = (DocumentS[]) obj;
				System.out.println(index + "--------" + docss.length);
				if (!queue.offer(docss, 2, TimeUnit.SECONDS)) {
					System.out.println(Thread.currentThread().getName()
							.toString());
				}
				objis.close();
				sockets[index].close();
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (InterruptedException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
