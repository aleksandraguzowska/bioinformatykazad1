function [ FastaSet ] = loadFasta( method,varargin )
%funkcja przyjmuj¹ca jako argument nazwê metody (manual/file/ncbi 
%oraz Ÿród³o (w przypadku metody file - nazwê pliku fasta, w przypadku
%metody ncbi identyfikator sekwencji z bazy nukleotydów) i zwracaj¹ca
%tablicê charów przetworzon¹ za pomoc¹ funkcji parseFasta


if strcmp(method,'manual')
    fastaContent = inputFasta;
elseif strcmp(method,'file')
    fastaContent = fetchFasta(varargin{1});
elseif strcmp(method,'ncbi')
    fastaContent = fetchNCBI(varargin{1});
end


FastaSet = parseFasta(fastaContent);


end
    
