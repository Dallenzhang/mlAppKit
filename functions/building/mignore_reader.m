function c = mignore_reader(migDir)
%% Subfunction handling files and folders to ignore with respect to building `classdef` files
% sth like .gitignore
%
% :param migDir:  path to the .mignore file 
% :type migDir: char array
%
% :returns: name of files and folders to ignore
% :rtype: cell-array
%
if nargin ==1
    fid =fopen(fullfile(migDir,'.mignore'));
else
    fid =fopen('.mignore');
end

y = 1;
c     = cell(1);
tline = fgetl(fid);

while ischar(tline)
    
    comment_start=min(regexp(tline,'[%]'));
    if ~isempty(comment_start) 
        
        tline = tline(1:comment_start);
    end
    
    % only collect data, jump lines with matlab comment `%`
    if ~strcmp(tline,'%')
        c(y,1)={tline};
    end
    y= y+1;
    tline = fgetl(fid);
end

% only collect cells with data
empt=cellfun('isempty',c); %'unfiorminput',false

c=c(~empt);

fclose(fid);
end