function [ fastaContent ] = inputFasta()
%funkcja pobieraj¹ca od u¿ytkownika identyfikator, opis i sekwencjê
%oraz zwracaj¹ca zmienn¹ fastaContent, zawieraj¹c¹ powy¿sze dane
%w formie tekstu z pliku fasta

fastaContent =['>', input('identifier: ','s')...
    char(10), input('sequence: ','s')];


end

