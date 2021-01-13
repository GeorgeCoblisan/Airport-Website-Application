package utils;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import routs.Oras;
import struct.*;

public class DButils<pulic> {
    public static void inregistrare(Connection con,UserAccount ua) throws SQLException
    {
       String sql="insert into inregistrare (nume, prenume, email, CNP, nr_telefon, parola)values (?, ?, ?, ?, ?, ?);";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,ua.getnume());
        pstm.setString(2,ua.getprenume());
        pstm.setString(3,ua.getEmail());
        pstm.setString(4,ua.getCNP());
        pstm.setString(5,ua.getNr_telefon());
        pstm.setString(6,ua.getPassword());

        pstm.executeUpdate();
    }
    public static UserAccount findUser(Connection conn,String firstname,String secondname,String password) throws SQLException
    {
        String sql="select a.nume,a.prenume,a.parola, a.email, a.CNP ,a.nr_telefon  from inregistrare a where a.nume=? and a.prenume=? and a.parola=?;";
        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1,firstname);
        pstm.setString(2,secondname);
        pstm.setString(3,password);
        ResultSet rs = pstm.executeQuery();

        if(rs.next())
        {
            String email= rs.getString("email");
            String CNP = rs.getString("CNP");
            String nr_telefon = rs.getString("nr_telefon");
            UserAccount user = new UserAccount();
            user.setEmail(email);
            user.setCNP(CNP);
            user.setNr_telefon(nr_telefon);
            user.setNume(firstname);
            user.setPrenume(secondname);
            user.setPassword(password);
            return user;
        }
        return null;
    }
    public static UserAccount findUser(Connection conn, String firstName) throws SQLException
    {
        String sql = "Select a.nume, a.prenume, a.parola, a.email, a.CNP ,a.nr_telefon  from inregistrare a where a.nume = ?;";

        PreparedStatement pstm = conn.prepareStatement(sql);
        pstm.setString(1, firstName);

        ResultSet rs = pstm.executeQuery();

        if (rs.next())
        {
            String email= rs.getString("email");
            String CNP = rs.getString("CNP");
            String nr_telefon = rs.getString("nr_telefon");
            String password = rs.getString("parola");
            String secondname = rs.getString("prenume");
            UserAccount user = new UserAccount();
            user.setEmail(email);
            user.setCNP(CNP);
            user.setNr_telefon(nr_telefon);
            user.setNume(firstName);
            user.setPrenume(secondname);
            user.setPassword(password);
            return user;
        }

        return null;
    }

    public static List<Flights> queryFlights(Connection con) throws SQLException
    {
       String sql="Select a.id_zbor, a.plecare, a.ora_plecare,a.destinatie,c.nume,p.nume,a.poarta From zboruri a,companie c,avioane p Where a.id_avion=p.id_avion and p.id_companie=c.id_companie order by a.id_zbor asc;";
        PreparedStatement pstm = con.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Flights> list = new ArrayList<Flights>();
        while (rs.next()) {
            int id_z=rs.getInt("id_zbor");
            Time ora_p = rs.getTime("ora_plecare");
            String plecare = rs.getString("a.plecare");
            String destinatie = rs.getString("destinatie");
            String companie = rs.getString("c.nume");
            String avion = rs.getString("p.nume");
            String gate = rs.getString("poarta");
            Flights fl = new Flights();
            fl.setId_flight(id_z);
            fl.setOra_plecare(ora_p);
            fl.setPlecare(plecare);
            fl.setDestinatie(destinatie);
            fl.setCompanie(companie);
            fl.setAvion(avion);
            fl.setPoarta(gate);
            list.add(fl);
        }
        return list;
    }
    public static List<Company> queryCompanys(Connection con) throws SQLException
    {
        String sql="select nume, sediu, data_inf, nr_avioane, nr_angajati from companie;";
        PreparedStatement pstm = con.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Company> listc = new ArrayList<Company>();
        while(rs.next())
        {
            String name= rs.getString("nume");
            String office=rs.getString("sediu");
            Date data=rs.getDate("data_inf");
            int number_a=rs.getInt("nr_avioane");
            int number_empl=rs.getInt("nr_angajati");
            Company c1=new Company();
            c1.setNr_angajati(number_empl);
            c1.setNume(name);
            c1.setNr_avioane(number_a);
            c1.setData_inf(data);
            c1.setSediu(office);
            listc.add(c1);
        }
        return listc;
    }
    public static List<Reviews> queryReviews(Connection con) throws SQLException
    {
        String sql="select personal_aeroport.nume, personal_aeroport.prenume, comentariu from reviews, personal_aeroport where reviews.id_angajat=personal_aeroport.id_angajat;";
        PreparedStatement pstm = con.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Reviews> listra = new ArrayList<Reviews>();
        while(rs.next())
        {
            String numea=rs.getString("personal_aeroport.nume");
            String prenumea=rs.getString("personal_aeroport.prenume");
            String review=rs.getString("comentariu");
            Reviews r1=new Reviews();
            r1.setReview(review);
            r1.setNume_angajat(numea+" "+prenumea);
            listra.add(r1);
        }
        return listra;
    }
    public static List<Reviews> queryReviewsUC(Connection con) throws SQLException
    {
        String sql="select duty_free.nume, comentariu from duty_free, reviews where reviews.id_uc=duty_free.id_uc;";
        PreparedStatement pstm = con.prepareStatement(sql);
        ResultSet rs = pstm.executeQuery();
        List<Reviews> listruc = new ArrayList<Reviews>();
        while(rs.next())
        {
            String name=rs.getString("duty_free.nume");
            String reviewuc=rs.getString("comentariu");
            Reviews r2=new Reviews();
            r2.setNume_duty_free(name);
            r2.setReview(reviewuc);
            listruc.add(r2);
        }
        return listruc;
    }
    public static void LeaveReviewAngajat(Connection con, ReviewSubmit rev) throws SQLException
    {
        String sql="call descifrare_review_personal(?,?,?)";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1,rev.getNumea());
        pstm.setString(2,rev.getPrenumea());
        pstm.setString(3,rev.getReview());


        pstm.executeUpdate();
    }
    public static void LeaveReviewUC(Connection con, ReviewSubmit rev) throws SQLException
    {
        String sql="call descifrare_review_uc(?,?)";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, rev.getNume_duty_free());
        pstm.setString(2,rev.getReview());

        pstm.executeUpdate();
    }
    public static boolean VerfRout(Connection con, List<Oras> rout,String data,String pers,String cargo) throws SQLException
    {
        for(int i=0;i< rout.size()-1;i++)
        {
            String oras1=rout.get(i).nume;
            String oras2=rout.get(i+1).nume;
            String tipZbor=null;
            if(pers!=null&&cargo==null) {
                tipZbor = "pasageri";
            }
            else if(pers==null&&cargo!=null)
            {
                tipZbor="cargo";
            }
                String sql = "Select z.plecare,z.destinatie,z.data_plecare From zboruri z Where z.plecare=? and z.destinatie=? and z.data_plecare>=? and z.tip_zbor=?";
                PreparedStatement pstm = con.prepareStatement(sql);
                pstm.setString(1, oras1);
                pstm.setString(2, oras2);
                pstm.setString(3, data);
                pstm.setString(4, tipZbor);
                ResultSet rs = pstm.executeQuery();
            if(rs.next())
            {
                continue;
            }
            else
            {
                return false;
            }
        }
        return true;
    }
   public static  List<Bilete> queryBilete(Connection con,List<Oras> rout,String eco,String bus,String fc) throws SQLException
    {
        List<Bilete> tickets = new ArrayList<Bilete>();
       for(int i=0;i< rout.size()-1;i++)
       {
           String sql=null;
           String oras1=rout.get(i).nume;
           String oras2=rout.get(i+1).nume;
           if(eco!=null&&bus==null&&fc==null) {
                sql = "Select distinct b.id_bilet,b.tip,b.loc,b.pret,b.tip_bagaj,z.ora_plecare,z.ora_sosire \n" +
                       "From bilete b,zboruri z \n" +
                       "Where z.id_zbor=b.id_zbor and z.plecare=? and z.destinatie=? and b.tip='economy' and  b.status=1;";
           }
           else if(eco==null&&bus!=null&&fc==null)
           {
                sql = "Select distinct b.id_bilet,b.tip,b.loc,b.pret,b.tip_bagaj,z.ora_plecare,z.ora_sosire \n" +
                       "From bilete b,zboruri z \n" +
                       "Where z.id_zbor=b.id_zbor and z.plecare=? and z.destinatie=? and b.tip='business' and  b.status=1;";
           }
           else if(eco==null&&bus==null&&fc!=null)
           {
                sql = "Select distinct b.id_bilet,b.tip,b.loc,b.pret,b.tip_bagaj,z.ora_plecare,z.ora_sosire \n" +
                       "From bilete b,zboruri z \n" +
                       "Where z.id_zbor=b.id_zbor and z.plecare=? and z.destinatie=? and b.tip='first class' and  b.status=1;";
           }
           PreparedStatement pstm = con.prepareStatement(sql);
           pstm.setString(1, oras1);
           pstm.setString(2, oras2);
           ResultSet rs = pstm.executeQuery();
           Bilete b1=new Bilete();
           if(rs.next())
           {
               b1.setNr_bilet(rs.getInt("b.id_bilet"));
               b1.setLoc(rs.getInt("b.loc"));
               b1.setTip_bilet(rs.getString("b.tip"));
               b1.setPret(rs.getInt("b.pret"));
               b1.setTip_bagaj(rs.getString("b.tip_bagaj"));
               b1.setOra_plecare(rs.getTime("z.ora_plecare"));
               b1.setOra_sosire(rs.getTime("z.ora_sosire"));
               tickets.add(b1);
           }

       }

     return tickets;
    }

   public static void buyTicket(Connection con,List<Bilete> tickets,UserAccount ua,String data) throws SQLException
   {
       for(int i=0;i<tickets.size();i++)
       {
           int nr_bilet=tickets.get(i).getNr_bilet();
           int pret=tickets.get(i).getPret();
           String sql="Select c.id_client From clientt c Where c.nume=? and c.prenume=?";
           PreparedStatement pstm = con.prepareStatement(sql);
           pstm.setString(1, ua.getnume());
           pstm.setString(2, ua.getprenume());
           ResultSet rs = pstm.executeQuery();
           rs.next();
           int id_client=rs.getInt("c.id_client");
           String sql1="insert into tranzactie (id_bilet,id_client,data_achizitie) values(?,?,?);";
           PreparedStatement pstm1 = con.prepareStatement(sql1);
           pstm1.setInt(1, nr_bilet);
           pstm1.setInt(2, id_client);
           pstm1.setString(3,data);
           pstm1.executeUpdate();

           String sql2="Update bilete SET status=0 Where id_bilet=?";
           PreparedStatement pstm2 = con.prepareStatement(sql2);
           pstm2.setInt(1,nr_bilet);
           pstm2.executeUpdate();
       }
   }
    public static List<Bilete> queryIstoricBilete(Connection con,UserAccount ua) throws SQLException
    {
        String sql="Select c.id_client From clientt c Where c.nume=? and c.prenume=?";
        PreparedStatement pstm = con.prepareStatement(sql);
        pstm.setString(1, ua.getnume());
        pstm.setString(2, ua.getprenume());
        ResultSet rs = pstm.executeQuery();
        rs.next();
        int id_client=rs.getInt("c.id_client");
        String sql1="Select t.id_bilet,z.id_zbor,b.tip,b.loc,t.pret_final,b.tip_bagaj \n" +
                "From tranzactie t,bilete b,zboruri z \n" +
                "Where t.id_bilet=b.id_bilet and b.id_zbor=z.id_zbor and t.id_client=?;";
        PreparedStatement pstm1 = con.prepareStatement(sql1);
        pstm1.setInt(1,id_client);
        ResultSet rs1 = pstm1.executeQuery();
        List<Bilete> bil = new ArrayList<Bilete>();
        while(rs1.next())
        {
            int id_bilet=rs1.getInt("t.id_bilet");
            int id_zbor=rs1.getInt("z.id_zbor");
            String tip=rs1.getString("b.tip");
            int loc=rs1.getInt("b.loc");
            int pret_final=rs1.getInt("t.pret_final");
            String tip_bagaj=rs1.getString("tip_bagaj");
            Bilete b1=new Bilete();
            b1.setNr_bilet(id_bilet);
            b1.setNr_zbor(id_zbor);
            b1.setTip_bilet(tip);
            b1.setLoc(loc);
            b1.setPret(pret_final);
            b1.setTip_bagaj(tip_bagaj);
            bil.add(b1);

        }
      return bil;
    }

}
