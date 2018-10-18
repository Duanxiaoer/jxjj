package yxjj;

import java.io.Serializable;

public class Tucao implements Serializable {
    private String info,id,zan,cai,jubao;
    public Tucao() {
        super();
        // TODO Auto-generated constructor stub
    }

    public String getInfo() {
        return info;
    }

    public String getId() {
        return id;
    }

    public String getZan() {
        return zan;
    }

    public String getCai() {
        return cai;
    }

    public String getJubao() {
        return jubao;
    }

    public Tucao(String info, String id, String zan, String cai, String jubao) {
        super();
        this.info = info;
        this.id = id;
        this.id = cai;
        this.id = jubao;

    }
}

