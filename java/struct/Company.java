package struct;
import java.util.Date;
public class Company {
    private String nume;
    private String sediu;
    private Date data_inf;
    private int nr_avioane;
    private int nr_angajati;

    public String getNume() {
        return nume;
    }

    public void setNume(String nume) {
        this.nume = nume;
    }

    public String getSediu() {
        return sediu;
    }

    public void setSediu(String sediu) {
        this.sediu = sediu;
    }

    public Date getData_inf() {
        return data_inf;
    }

    public void setData_inf(Date data_inf) {
        this.data_inf = data_inf;
    }

    public int getNr_avioane() {
        return nr_avioane;
    }

    public void setNr_avioane(int nr_avioane) {
        this.nr_avioane = nr_avioane;
    }

    public int getNr_angajati() {
        return nr_angajati;
    }

    public void setNr_angajati(int nr_angajati) {
        this.nr_angajati = nr_angajati;
    }
}
