function quickstart_template_creator()
   % create a boilerplate from the current app 
   % and save it into functions/template/ <projectName>
   %
   % working directory == currentPrj
   %
    currentPrj = pwd();
    
    projectName     = 'mlappkit_qst';
    path_to_project = fullfile ( userpath()      , 'tmp_mlappkit');
    complete_path   = fullfile ( path_to_project , projectName) ;
    
    %% create the minimum folder structure
    mkdir (complete_path)
    mkdir (fullfile(path_to_project,[projectName,'-docs']));

    mkdir (fullfile( complete_path , 'host') );
    mkdir (fullfile( complete_path , 'popups' ));
    mkdir (fullfile( complete_path , 'firstplugin'))
    mkdir (fullfile( complete_path , 'functions','start_up'))
    mkdir (fullfile( complete_path , 'functions','panel_visibility'))
    mkdir (fullfile( complete_path , 'settings' ));
    mkdir (fullfile( complete_path , 'docs' ));
    mkdir (fullfile( complete_path , 'static' ));
    
    %% create files
    mig= fopen(fullfile ( complete_path , '.mignore' ),'w');
    fprintf(mig,'%s',['docs',newline()]);
    fprintf(mig,'%s',['static',newline()]);
    fprintf(mig,'%s',['readme',newline()]);
    fprintf(mig,'%s',['license',newline()]);
    fclose(mig);

    gitig=fopen(fullfile ( complete_path , '.gitignore' ),'w');
    fclose(gitig);

    
    %% copy a set of boilerplate apps
    
  [SUCCESS,MESSAGE,MESSAGEID] =...
      copyfile(fullfile( currentPrj, 'popups','popup_about.mlapp' ), ...
               fullfile( complete_path , 'popups' ),...
              'f') ;
         
  [~,~,~] =...
      copyfile(fullfile( currentPrj, 'popups','popup_settings.mlapp' ), ...
               fullfile( complete_path , 'popups' ),...
              'f') ;
         
  [~,~,~] =...
      copyfile(fullfile( currentPrj, 'host','host_app.mlapp' ), ...
               fullfile( complete_path , 'host' ),...
              'f') ;

  [~,~,~] =...
      copyfile(fullfile( currentPrj, 'firstplugin','calculator.mlapp' ), ...
               fullfile( complete_path , 'firstplugin' ),...
              'f') ;
         
  [~,~,~] =...
      copyfile(fullfile( currentPrj, 'firstplugin','redbutton.mlapp' ), ...
               fullfile( complete_path , 'firstplugin' ),...
              'f') ;
         
    %% copy set of project specific functions
    % projectPaths.appuser = ...
    %    matlab.codetools.requiredFilesAndProducts(fullfile(pwd(), 'host','host_app.mlapp'))';

    [~,~,~] =...
      copyfile( fullfile(currentPrj ,'functions','panel_visibility','panel_visibility_switch.m'),...
                fullfile( complete_path , 'functions','panel_visibility' ),...
                'f') ;
    [~,~,~] =...
      copyfile( fullfile(currentPrj ,'make.m'),...
                fullfile( complete_path ),...
                'f') ;
    [~,~,~] =...
      copyfile( fullfile(currentPrj ,'functions','start_up','ext_start_up.m'),...
                fullfile( complete_path , 'functions','start_up' ),...
                'f') ;
    % create a readme
    % write  a licence

   %% package it  
   % zip it   % copy it into template folder
   if  exist(fullfile(currentPrj,'functions','templates'),'dir')~= 7 
       mkdir (fullfile(currentPrj,'functions','templates'));
   end
   
   zip(fullfile(currentPrj,'functions','templates','mlappkit_qst.zip'),...
       complete_path);
 
   % delete temporary files
   rmdir(complete_path, 's');
   
end