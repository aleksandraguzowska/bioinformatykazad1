clc;
clear all;

fprintf('Script draw a dotplot of two sequences using window and treshold\n\n');

%SEQUENCE1
while 1
  fprintf('Choose the way to input first sequence \nmanual - manual\nfile - from FASTA format file\nncbi - from NCBI database\n\n');
  way = input('','s');
  if strcmp(way,'manual') | strcmp(way,'file') | strcmp(way,'ncbi')
      break;
  end
end

if strcmp(way,'manual')
    FastaSet1 = loadFasta(way);    
elseif strcmp(way,'file')
    filename = input('filename: ','s');
    FastaSet1 = loadFasta(way, filename); 
elseif strcmp(way,'ncbi')
    identifier = input('identifier: ','s');
    FastaSet1 = loadFasta(way); 
end
fprintf('First sequence import succesfully\n\n');

%SEQUENCE2
while 1
  fprintf('Choose the way to input second sequence \nmanual - manual\nfile - from FASTA format file\nncbi - from NCBI database\n');
  way = input('','s');
  if strcmp(way,'manual') | strcmp(way,'file') | strcmp(way,'ncbi')
      break;
  end
end

if strcmp(way,'manual')
    FastaSet2 = loadFasta(way);    
elseif strcmp(way,'file')
    filename = input('filename: ','s');
    FastaSet2 = loadFasta(way, filename); 
elseif strcmp(way,'ncbi')
    identifier = input('identifier: ','s');
    FastaSet2 = loadFasta(way); 
end

fprintf('Second sequence import succesfully\n\n');

window = input('window: ');
treshold = input('treshold: ');

fprintf('\n\n');

dotplot(FastaSet1,FastaSet2,window,treshold);
