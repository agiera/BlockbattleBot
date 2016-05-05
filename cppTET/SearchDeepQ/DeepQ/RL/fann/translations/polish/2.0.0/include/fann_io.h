/*
  Fast Artificial Neural Network Library (fann)
  Copyright (C) 2003 Steffen Nissen (lukesky@diku.dk)

  Biblioteka ta jest wolnym oprogramowaniem; mo�esz j� rozpowwszechnia� i/lub
  modyfikowa� na zasadach licencji GNU Lesser General Public License
  publikowanej przez Fundacj� Free Software; r�wnie� zgodnie z wersj� 2.1 
  i  ka�d� p�niejsz�. 

  Biblioteka jest rozpowszechniana w nadziei, �e b�dzie ona u�yteczna
  jednak bez �ADNEJ GWARANCJI; bez �adnej gwarancji 
  FUNKCJONALNO�CI albo U�YTECZNO�CI DLA OKRE�LONEGO
  CELU. W celu uzyskania wi�kszej ilo�ci szczeg��w zobacz Licencj� GNU. 

  Powinniene� otrzyma� kopi� licencji GNU Lesser General Public
  License wraz z t� bibliotek�; je�li nie, napisz do Fundacji Free 
  Software: 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/  
	
/* Ten plik definiuje interfejs u�ytkownika do biblioteki FANN.
   Inkludowany jest z plik�w fixedfann.h, floatfann.h i doublefann.h 
   i NIE powinien by� inkludowany bezpi�rednio. Je�li zostanie
   zainkludowany bezpo�renio b�dzie zachowywa� si� tak, jakby plik 
   floatfann.h zosta� zainkludowany. 
   */

#ifndef __fann_io_h__
#define __fann_io_h__
	
/* Section: FANN File Input/Output 
   
   Istnieje mo�liwo�� zapisania ca�ej SNN do pliku poleceniem <fann_save>, aby w przysz�o�ci za�adowa� go za pomoc� <fann_create_from_file>.
 */	

/* Group: File Input and Output */	

/* Function: fann_create_from_file
   
   Tworzy sie� neuronow� z propagacj� wsteczn� na podstawie pliku konfiguracyjnego, kt�ry zosta� zapisany za pomoc� <fann_save>.
   
   Zobacz tak�e :
   	<fann_save>, <fann_save_to_fixed>
   	
   Funkcja ta wyst�puje w wersji FANN >= 1.0.0.
 */
FANN_EXTERNAL struct fann *FANN_API fann_create_from_file(const char *configuration_file);


/* Function: fann_save

   Zapisuje ca�� sie� do pliku konfiguracyjnego.
   
  Plik konfiguracyjny zawiera wszystkie informacje na temat sieci neuronowej i pozwala funkcji 
   <fann_create_from_file> na tworzenie dok�adnej kopii siecii i wszystkich zwi�zanych z ni� parametr�w.
   
   Parametry (<fann_set_callback>, <fann_set_error_log>) NIE s� zapisywane 
   do pliku poniewa� nie mog� by� bezpiecznie zagnie�d�one w nowej lokalizacji. 
   Tak�e tymczasowe parametry generowane w czasie uczenia, jak <fann_get_MSE> nie s� zapisywane
   
   Co zwraca funkcja:
   Funkcja zwraca 0 przy powodzeniu i -1 przy wyst�pieniu b��du.
   
   Zobacz tak�e:
    <fann_create_from_file>, <fann_save_to_fixed>

   Funkcja ta wyst�puje w wersji FANN >= 1.0.0.
 */
FANN_EXTERNAL int FANN_API fann_save(struct fann *ann, const char *configuration_file);


/* Function: fann_save_to_fixed

   Zapisuje ca�� sie� do plilku konfiguracyjnego. 
   Jednak zapisuje j� w zmienionym formacie, niezale�nie
   od tego jaki format jest aktualnie u�ywany.

   Jest to u�yteczne w momecie uczenia sieci zmiennopozycyjnych ,
   i uruchamianie ich w okre�lonym punkcie.

   Funkcja zwraca bitow� pozycj� okre�lonego punktu, kt�ry mo�e by� u�yty
   w celu dowiedzenia si� czy w�a�ciwe b�dzie okre�lenie punktu.
   Wysoka warto�� oznacza du�� precyzj�, w przeciwie�stwie do warto�ci 
   niskiej �wiadcz�cej o niskiej precyzji.

   Warto�� ujemna oznacza bardzo nisk� precyzj�, 
   i bardzo du�e prawdopodobie�stwo przepe�nienia. 
   Pierwotnie punkt ustawiony jest na 0, wi�c warto��
   ujemna nie ma sensu. 

   W wi�kszo�ci przypadk�w wynik mniejszy od 6 jest niezadowalaj�cy
   i powinno si� unika� takich punkt�w. 
   Najlepszym sposobem na unikni�cie takich wynik�w jest ograniczenie
   ilo�� po��cze� do ka�dego neuronu, lub po prostu mniej neuron�w  
   w ka�dej warstwie. 
   
   U�ycie tej funkcji jest przeznaczone dla komputer�w
   nie wykonuj�cych operacji zmiennoprzecinkowych. 
   Aktualnie wi�kszo�� komputer�w bardzo dobrze radzi sobie 
   z takimi operacjami
   
   Zo bacz tak�e : :
    <fann_create_from_file>, <fann_save>

   Funkcja pojawi�� si� w FANN  >= 1.0.0.
*/ 
FANN_EXTERNAL int FANN_API fann_save_to_fixed(struct fann *ann, const char *configuration_file);
	
#endif
