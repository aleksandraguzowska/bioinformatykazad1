function [ mNW ] = dotplot( FastaSet1, FastaSet2, window, treshold )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here


seq1 = char(FastaSet1(1,2));
seq1ID = char(FastaSet1(1,1));

seq2 = char(FastaSet2(1,2));
seq2ID = char(FastaSet2(1,1));


N1 = length(seq1);
N2 = length(seq2);

mNW = zeros(N1, N2); %macierz nieprzefiltrowana
fmNW = zeros(N1, N2); %macierz przefiltrowana

%uzupe³nienie macierzy jedynkami w miejscach dopasowania
for i=1:N1
    for j=1:N2
       
        if (seq1(i)==seq2(j))
           
            mNW(j,i) = 1;
           
        end      
       
    end  
end


%filtracja macierzy zadanym oknem i zgodnoœci¹
counter = 0;
for i=1:N1-window+1
    for j=1:N2-window+1
       
        for k=0:window-1
           if(mNW(j+k,i+k)==1)
               counter=counter+1;
           end
        end
        
        if counter>=(window-treshold)
            for k=0:window-1
                fmNW(j+k,i+k)=mNW(j+k,i+k);
            end
            
        end
       counter = 0;
    end  
end


%umieszczenie ka¿dej litery sekwencji osobno w tablicy w celu umieszczenia
%ich na osiach
names1 = cellstr(seq1');
names2 = cellstr(seq2');

%przekszta³cenie macierzy w wykres kropkowy
spy(sparse(fmNW));
%tytu³ wykresu
T = [seq1ID,' vs. ',seq2ID];
title(gca,T);
%zastêpowanie znaczników osi literami
set(gca, 'xtick',[1:N1], 'xticklabel',names1);
set(gca, 'ytick',[1:N2], 'yticklabel',names2);
%przesuwanie znaczniików osi x ponad wykres
set(gca, 'XAxisLocation', 'top');  
%usuwanie znacznika nz=...
delete(findall(findall(gcf,'Type','axe'),'Type','text'));

%zapisywanie macierzy do pliku
F = [T,'.jpg'];
saveas(gca,F);
F = ['File ',F,' save succesfully\n'];
fprintf(F);
end