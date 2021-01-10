function [ fastaContent ] = fetchFasta( filename )
%funkcja otwieraj¹ca plik fasta znajduj¹cy siê na urz¹dzeniu za pomoc¹ jego
%nazwy i wpisuj¹ca jego treœæ do zwracanej zmiennej fastaContent

filename = strcat(filename,'.fasta');
fastaContent = fileread(filename);
                        
end


