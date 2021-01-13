package routs;

import java.util.ArrayList;

public class Oras {
	
	public String nume;
	public ArrayList<Oras> vecini;
	
	public Oras parinte;
	public boolean vizitat;
	
	public Oras(String nume)
	{
		this.nume = nume;
		vecini = new ArrayList<Oras>();
		vizitat = false;
	}


	public String getNume() {
		return nume;
	}

	public void setNume(String nume) {
		this.nume = nume;
	}
}
