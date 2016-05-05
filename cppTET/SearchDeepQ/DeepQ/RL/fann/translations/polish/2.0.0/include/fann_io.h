/*
  Fast Artificial Neural Network Library (fann)
  Copyright (C) 2003 Steffen Nissen (lukesky@diku.dk)

  Biblioteka ta jest wolnym oprogramowaniem; mo¿esz j¹ rozpowwszechniaæ i/lub
  modyfikowaæ na zasadach licencji GNU Lesser General Public License
  publikowanej przez Fundacjê Free Software; równie¿ zgodnie z wersj¹ 2.1 
  i  ka¿d¹ póŸniejsz¹. 

  Biblioteka jest rozpowszechniana w nadziei, ¿e bêdzie ona u¿yteczna
  jednak bez ¯ADNEJ GWARANCJI; bez ¿adnej gwarancji 
  FUNKCJONALNOŒCI albo U¯YTECZNOŒCI DLA OKREŒLONEGO
  CELU. W celu uzyskania wiêkszej iloœci szczegó³ów zobacz Licencjê GNU. 

  Powinnieneœ otrzymaæ kopiê licencji GNU Lesser General Public
  License wraz z t¹ bibliotek¹; jeœli nie, napisz do Fundacji Free 
  Software: 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
*/  
	
/* Ten plik definiuje interfejs u¿ytkownika do biblioteki FANN.
   Inkludowany jest z plików fixedfann.h, floatfann.h i doublefann.h 
   i NIE powinien byæ inkludowany bezpiœrednio. Jeœli zostanie
   zainkludowany bezpoœrenio bêdzie zachowywa³ siê tak, jakby plik 
   floatfann.h zosta³ zainkludowany. 
   */

#ifndef __fann_io_h__
#define __fann_io_h__
	
/* Section: FANN File Input/Output 
   
   Istnieje mo¿liwoœæ zapisania ca³ej SNN do pliku poleceniem <fann_save>, aby w przysz³oœci za³adowaæ go za pomoc¹ <fann_create_from_file>.
 */	

/* Group: File Input and Output */	

/* Function: fann_create_from_file
   
   Tworzy sieæ neuronow¹ z propagacj¹ wsteczn¹ na podstawie pliku konfiguracyjnego, który zosta³ zapisany za pomoc¹ <fann_save>.
   
   Zobacz tak¿e :
   	<fann_save>, <fann_save_to_fixed>
   	
   Funkcja ta wystêpuje w wersji FANN >= 1.0.0.
 */
FANN_EXTERNAL struct fann *FANN_API fann_create_from_file(const char *configuration_file);


/* Function: fann_save

   Zapisuje ca³¹ sieæ do pliku konfiguracyjnego.
   
  Plik konfiguracyjny zawiera wszystkie informacje na temat sieci neuronowej i pozwala funkcji 
   <fann_create_from_file> na tworzenie dok³adnej kopii siecii i wszystkich zwi¹zanych z ni¹ parametrów.
   
   Parametry (<fann_set_callback>, <fann_set_error_log>) NIE s¹ zapisywane 
   do pliku poniewa¿ nie mog¹ byæ bezpiecznie zagnie¿d¿one w nowej lokalizacji. 
   Tak¿e tymczasowe parametry generowane w czasie uczenia, jak <fann_get_MSE> nie s¹ zapisywane
   
   Co zwraca funkcja:
   Funkcja zwraca 0 przy powodzeniu i -1 przy wyst¹pieniu b³êdu.
   
   Zobacz tak¿e:
    <fann_create_from_file>, <fann_save_to_fixed>

   Funkcja ta wystêpuje w wersji FANN >= 1.0.0.
 */
FANN_EXTERNAL int FANN_API fann_save(struct fann *ann, const char *configuration_file);


/* Function: fann_save_to_fixed

   Zapisuje ca³¹ sieæ do plilku konfiguracyjnego. 
   Jednak zapisuje j¹ w zmienionym formacie, niezale¿nie
   od tego jaki format jest aktualnie u¿ywany.

   Jest to u¿yteczne w momecie uczenia sieci zmiennopozycyjnych ,
   i uruchamianie ich w okreœlonym punkcie.

   Funkcja zwraca bitow¹ pozycjê okreœlonego punktu, który mo¿e byæ u¿yty
   w celu dowiedzenia siê czy w³aœciwe bêdzie okreœlenie punktu.
   Wysoka wartoœæ oznacza du¿¹ precyzjê, w przeciwieñstwie do wartoœci 
   niskiej œwiadcz¹cej o niskiej precyzji.

   Wartoœæ ujemna oznacza bardzo nisk¹ precyzjê, 
   i bardzo du¿e prawdopodobieñstwo przepe³nienia. 
   Pierwotnie punkt ustawiony jest na 0, wiêc wartoœæ
   ujemna nie ma sensu. 

   W wiêkszoœci przypadków wynik mniejszy od 6 jest niezadowalaj¹cy
   i powinno siê unikaæ takich punktów. 
   Najlepszym sposobem na unikniêcie takich wyników jest ograniczenie
   iloœæ po³¹czeñ do ka¿dego neuronu, lub po prostu mniej neuronów  
   w ka¿dej warstwie. 
   
   U¿ycie tej funkcji jest przeznaczone dla komputerów
   nie wykonuj¹cych operacji zmiennoprzecinkowych. 
   Aktualnie wiêkszoœæ komputerów bardzo dobrze radzi sobie 
   z takimi operacjami
   
   Zo bacz tak¿e : :
    <fann_create_from_file>, <fann_save>

   Funkcja pojawi³¹ siê w FANN  >= 1.0.0.
*/ 
FANN_EXTERNAL int FANN_API fann_save_to_fixed(struct fann *ann, const char *configuration_file);
	
#endif
