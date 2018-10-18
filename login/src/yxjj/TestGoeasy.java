package yxjj;

import io.goeasy.GoEasy;

public class TestGoeasy {

    public  void publish(){
        GoEasy goEasy = new GoEasy("https://rest-hangzhou.goeasy.io","BC-6a58030b5d6b44b1bbd27023e46bcb74");
        goEasy.publish("TestGoeasy","hello world");
    }

    public static void main(String[] args){
        TestGoeasy goeasy = new TestGoeasy();
        goeasy.publish();
    }
}
