package struct;

public class ReviewSubmit {
    private String nume_duty_free;
    private String review;
    private String numea;
    private String prenumea;

    public ReviewSubmit(String nume,String prenume,String review)
    {
        this.numea=nume;
        this.prenumea=prenume;
        this.review=review;
    }
    public ReviewSubmit(String review,String duty_free)
    {
        this.nume_duty_free=duty_free;
        this.review=review;
    }

    public String getNume_duty_free() {
        return nume_duty_free;
    }

    public void setNume_duty_free(String nume_duty_free) {
        this.nume_duty_free = nume_duty_free;
    }

    public String getReview() {
        return review;
    }

    public void setReview(String review) {
        this.review = review;
    }

    public String getNumea() {
        return numea;
    }

    public void setNumea(String numea) {
        this.numea = numea;
    }

    public String getPrenumea() {
        return prenumea;
    }

    public void setPrenumea(String prenumea) {
        this.prenumea = prenumea;
    }
}
