package struct;

import java.sql.Time;
import java.text.DecimalFormat;
import java.util.Date;

public class Bilete {
     private int nr_bilet;
     private String tip_bilet;
     private int loc;
     private int pret;
     private String tip_bagaj;
     private Time ora_plecare;
     private Time ora_sosire;
     private Date data_achizitie;
     private int nr_zbor;

    public int getNr_zbor() {
        return nr_zbor;
    }

    public void setNr_zbor(int nr_zbor) {
        this.nr_zbor = nr_zbor;
    }

    public Date getData_achizitie() {
        return data_achizitie;
    }

    public void setData_achizitie(Date data_achizitie) {
        this.data_achizitie = data_achizitie;
    }

    public int getNr_bilet() {
        return nr_bilet;
    }

    public void setNr_bilet(int nr_bilet) {
        this.nr_bilet = nr_bilet;
    }

    public String getTip_bilet() {
        return tip_bilet;
    }

    public void setTip_bilet(String tip_bilet) {
        this.tip_bilet = tip_bilet;
    }

    public int getLoc() {
        return loc;
    }

    public void setLoc(int loc) {
        this.loc = loc;
    }

    public int getPret() {
        return pret;
    }

    public void setPret(int pret) {
        this.pret = pret;
    }

    public String getTip_bagaj() {
        return tip_bagaj;
    }

    public void setTip_bagaj(String tip_bagaj) {
        this.tip_bagaj = tip_bagaj;
    }

    public Time getOra_plecare() {
        return ora_plecare;
    }

    public void setOra_plecare(Time ora_plecare) {
        this.ora_plecare = ora_plecare;
    }

    public Time getOra_sosire() {
        return ora_sosire;
    }

    public void setOra_sosire(Time ora_sosire) {
        this.ora_sosire = ora_sosire;
    }
}
