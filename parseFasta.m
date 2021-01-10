function [ FastaSet ] = parseFasta( fastaContent )
%funkcja przyjmuj¹ca jako argument tekst z pliku fasta 
%i zwracaj¹ca tablicê charów z identyfikatorem sekwencji i sekwencj¹

%identyfikator sekwencji
id = sscanf(fastaContent,strcat('>','%s'));

%sekwencja
expression= '\n.+';
sequence = regexp(fastaContent,expression,'match');
sequence = regexprep(sequence,'\n','');

FastaSet = [id sequence];

end

