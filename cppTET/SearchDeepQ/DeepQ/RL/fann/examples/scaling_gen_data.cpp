#include <fstream>
#include <cmath>
#include "fann.h"

using namespace std;

fann_type target_function( fann_type x, fann_type y, fann_type z )
{
	return x + y * cos( z );
}

void generate_training_data( ofstream &file )
{
	file << 10 * 10 * 10 << " " << 3 << " " << 1 << endl;
	for( unsigned i = 0; i < 10; i++ )
	{
		fann_type x = 1000.0 + i * 0.1;
		for( unsigned j = 0; j < 10; j++ )
		{
			fann_type y = 1.0 + j * 0.01;
			for( unsigned k = 0; k < 10; k++ )
			{
				fann_type z = k;
				file << x << " " << y << " " << z << endl << target_function( x, y, z ) << endl;
			}
		}
	}
}

int main()
{
	ofstream file( "scaling.data" );
	generate_training_data( file );
	file.close();
	return 0;
}
