package routs;

import java.util.ArrayList;

public class TestRute {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Graf graf = new Graf();
		
		ArrayList<Oras> ruta;
		
		ruta = graf.GasireRuta("Bucuresti", "Sofia");
		AfisareRuta(ruta);
		
		ruta = graf.GasireRuta("Bucuresti", "Roma");
		AfisareRuta(ruta);
		
		ruta = graf.GasireRuta("Bucuresti", "Tokyo");
		AfisareRuta(ruta);
		
		ruta = graf.GasireRuta("Bucuresti", "New York");
		AfisareRuta(ruta);
	}
	
	public static void AfisareRuta(ArrayList<Oras> ruta)
	{
		for (int i = 0; i < ruta.size(); i++)
		{
			System.out.print(ruta.get(i).nume);
			if (i < ruta.size() - 1)
				System.out.print(" -> ");
		}
		System.out.println();
	}

}
