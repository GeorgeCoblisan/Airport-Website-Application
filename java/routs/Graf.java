package routs;

import java.util.ArrayDeque;
import java.util.ArrayList;

public class Graf {

	public ArrayList<Oras> orase;
	private static Graf instanta;

	public static Graf getInstanta() {
		if(instanta==null)
		{instanta=new Graf();}
		return instanta;
	}

	public Graf()
	{
		orase = new ArrayList<Oras>();
		
		//Tari(Capitale) din jurul UE
		orase.add(new Oras("Bucuresti"));//0
		orase.add(new Oras("Sofia"));//1
		orase.add(new Oras("Atena"));//2
		orase.add(new Oras("Belgrad"));//3
		orase.add(new Oras("Zagreb"));//4
		orase.add(new Oras("Budapesta"));//5
		orase.add(new Oras("Viena"));//6
		orase.add(new Oras("Roma"));//7
		orase.add(new Oras("Berna"));//8
		orase.add(new Oras("Praga"));//9
		orase.add(new Oras("Berlin"));//10
		orase.add(new Oras("Munchen"));//11
		orase.add(new Oras("Paris"));//12
		orase.add(new Oras("Madrid"));//13
		orase.add(new Oras("Bruxelles"));//14
		orase.add(new Oras("Amsterdam"));//15
		orase.add(new Oras("Londra"));//16
		orase.add(new Oras("Kiev"));//17
		orase.add(new Oras("Moscova"));//18
		orase.add(new Oras("Ankara"));//19
		
		//Creare graf complet din orasele din jurul UE
		for (int i = 0; i < orase.size(); i++)
		{
			for (int j = 0; j < orase.size(); j++)
			{
				if (i != j)
				{
					orase.get(i).vecini.add(orase.get(j));
				}
			}
		}
		
		//Introducere orase de pe alte continente
		orase.add(new Oras("New York"));//20
		orase.add(new Oras("Washington"));//21
		orase.add(new Oras("San Francisco"));//22
		
		orase.add(new Oras("Mexico"));//23
		orase.add(new Oras("Bogota"));//24
		orase.add(new Oras("Brasilia"));//25
		
		orase.add(new Oras("Alger"));//26
		orase.add(new Oras("Cape Town"));//27
		orase.add(new Oras("Cairo"));//28
		orase.add(new Oras("Riad"));//29
		
		orase.add(new Oras("New Delhi"));//30
		orase.add(new Oras("Beijing"));//31
		orase.add(new Oras("Tokyo"));//32
		

		//US <-> UE
		CreareLegatura("Washington", "Londra");
		CreareLegatura("San Francisco", "Londra");
		CreareLegatura("Mexico", "Londra");
		CreareLegatura("New York", "Londra");
		
		//America de Sud <-> UE
		CreareLegatura("Bogota", "Madrid");
		CreareLegatura("Brasilia", "Madrid");
		
		//Africa <-> UE
		CreareLegatura("Alger", "Madrid");
		CreareLegatura("Cape Town", "Madrid");
		CreareLegatura("Cairo", "Atena");
		CreareLegatura("Riad", "Ankara");
		
		//Asia <-> UE
		CreareLegatura("New Delhi", "Ankara");
		CreareLegatura("Beijing", "Kiev");
		CreareLegatura("Tokyo", "Moscova");
	}
	
	private void CreareLegatura(String sursa, String destinatie)
	{
		int indexS = -1;
		int indexD = -1;
		
		for (int i = 0; i < orase.size(); i++)
		{
			Oras oras = orase.get(i);
			
			if (oras.nume.compareTo(sursa) == 0)
			{
				indexS = i;
				continue;
			}
			
			if (oras.nume.compareTo(destinatie) == 0)
			{
				indexD = i;
				continue;
			}
		}
		
		if (indexS == -1)
		{
			System.out.println(sursa + "nu a fost gasit");
			return;
		}
		
		if (indexD == -1)
		{
			System.out.println(destinatie + "nu a fost gasit");
			return;
		}
		
		orase.get(indexS).vecini.add(orase.get(indexD));
		orase.get(indexD).vecini.add(orase.get(indexS));
	}
	
	public Oras CautaOras(String nume)
	{
		for (Oras oras : orase)
		{
			if (oras.nume.compareTo(nume) == 0)
				return oras;
		}
		
		return null;
	}
	
	public ArrayList<Oras> GasireRuta(String numeSursa, String numeDestinatie)
	{
		ArrayList<Oras> ruta = new ArrayList<Oras>();
		
		for (Oras oras : orase)
		{
			oras.parinte = null;
			oras.vizitat = false;
		}
		
		Oras sursa = CautaOras(numeSursa);
		Oras destinatie = CautaOras(numeDestinatie);
		
		if (sursa == null || destinatie == null)
		{
			System.out.println("Sursa | Destinatia nu a fost gasita!");
			return ruta;
		}
		
		BFS(destinatie);
		
		if (sursa.parinte == null)
			return ruta;
		
		Oras oras = sursa;
		while (oras.parinte != null)
		{
			ruta.add(oras);
			oras = oras.parinte;
		}
		ruta.add(destinatie);
		
		return ruta;
	}
	
	public void BFS(Oras start)
	{
		ArrayDeque<Oras> coada = new ArrayDeque<Oras>();
		
		coada.addLast(start);
		start.vizitat = true;
		
		while (!coada.isEmpty())
		{
			Oras oras = coada.pollFirst();
			
			for (int i = 0; i < oras.vecini.size(); i++)
			{
				Oras vecin = oras.vecini.get(i);
				
				if (vecin.vizitat == false)
				{
					vecin.parinte = oras;
					vecin.vizitat = true;
					coada.addLast(vecin);
				}
			}
		}
	}
}
