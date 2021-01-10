function [ fastaContent ] = fetchNCBI( identifier )
%funkcja pobieraj¹ca plik fasta o danym identyfikatorze sekwencji
%za pomoc¹ narzêdzia ncbi entrez utilities 
%i umieszczaj¹ca jego treœæ w zwracanej zmiennej fastaContent

URL = 'https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi';
fastaContent = webread(URL, 'db','nucleotide',...
                            'rettype','fasta',...
                            'id',identifier);

                        
end
