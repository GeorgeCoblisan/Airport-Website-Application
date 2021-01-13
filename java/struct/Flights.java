package struct;
import java.sql.Time;
import java.util.Date;
public class Flights {
    private int id_flight;
    private String plecare;
    private String destinatie;
    private Date data_plecare;
    private Time ora_plecare;
    private Time ora_sosire;
    private String tip_zbor;
    private String status;
    private String avion;
    private String poarta;
    private String intarziere;
    private String pista;
    private String companie;

    public String getCompanie() {
        return companie;
    }

    public void setCompanie(String companie) {
        this.companie = companie;
    }

    //Nu avem nevoie de aici de lista de escale.
    public String getPlecare() {
        return plecare;
    }

    public int getId_flight() {
        return id_flight;
    }

    public void setId_flight(int id_flight) {
        this.id_flight = id_flight;
    }

    public void setPlecare(String plecare) {
        this.plecare = plecare;
    }

    public Date getData_plecare() {
        return data_plecare;
    }

    public void setData_plecare(Date data_plecare) {
        this.data_plecare = data_plecare;
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

    public String getTip_zbor() {
        return tip_zbor;
    }

    public void setTip_zbor(String tip_zbor) {
        this.tip_zbor = tip_zbor;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getAvion() {
        return avion;
    }

    public void setAvion(String avion) {
        this.avion = avion;
    }

    public String getPoarta() {
        return poarta;
    }

    public void setPoarta(String poarta) {
        this.poarta = poarta;
    }

    public String getIntarziere() {
        return intarziere;
    }

    public void setIntarziere(String intarziere) {
        this.intarziere = intarziere;
    }

    public String getPista() {
        return pista;
    }

    public void setPista(String pista) {
        this.pista = pista;
    }

    public String getDestinatie() {
        return destinatie;
    }

    public void setDestinatie(String destinatie) {
        this.destinatie = destinatie;
    }
}
