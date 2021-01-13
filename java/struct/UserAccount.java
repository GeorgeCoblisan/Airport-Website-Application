package struct;

public class UserAccount {
    //Procedura in mySQL de auto-increment pentru id in momentul in care se creeaza un user
    private String  nume;
    private String prenume;
    private String email;
    private String CNP;
    private String nr_telefon;
    private String password;

    public UserAccount(){}
    public UserAccount(String nume,String prenume,String email,String CNP,String nr_telefon,String password)
    {
        this.nume=nume;
        this.prenume=prenume;
        this.email=email;
        this.CNP=CNP;
        this.nr_telefon=nr_telefon;
        this.password=password;
    }

    public String getnume() {
        return nume;
    }

    public void setNume(String userNume) {
        this.nume = userNume;
    }
    public String getprenume() {
        return prenume;
    }

    public void setPrenume(String userPrenume) {
        this.prenume = userPrenume;
    }
    public String getEmail() {
        return email;
    }

    public void setEmail(String userEmail) {
        this.email = userEmail;
    }
    public String getCNP() {
        return CNP;
    }

    public void setCNP(String userCNP) {
        this.CNP = userCNP;
    }
    public String getNr_telefon() {
        return nr_telefon;
    }

    public void setNr_telefon(String userNr_telefon) {
        this.nr_telefon = userNr_telefon;
    }
    public String getPassword() {
        return password;
    }

    public void setPassword(String userPassword) {
        this.password = userPassword;
        }
    }

