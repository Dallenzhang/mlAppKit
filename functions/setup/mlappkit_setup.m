function mlappkit_setup()
    %% will walk user through the setup during the first run on the user machine.
    % It will:
    %
    % #. suggest a target directory and let you confirm or change it
    % #. unpack the ``static files`` into the confirmed location
    % #. add those particular files to your MATLAB searchpath
    % #. and save your current MATLAB searchpath
    %
    %
    % A list of the files added as well as the procedure executed will be
    % saved in a log file.
    %
    % Before submitting files or content please clean them of your 
    % personal data.
    %
    
    % suggest a installation path
    install_path    =  fullfile(userpath(), 'mlappkit');
    opt.Interpreter = 'tex';
    opt.Resize      = 'on';
    prompt = ['\fontsize{12} mlAppKit will be installed here ',... 
              '(will be created if it doesn`t exist)'];
    
    install_path = inputdlg(...
        prompt, ...         % question
        'Setup', ...        % window title
        [1 90], ...         % window size
        {install_path}, ... % suggestion
        opt);               % styling options
    
    install_path = install_path{1};      % cast from cell
    
    if exist(install_path, 'dir') ~= 7  
        mkdir(install_path)
    end
    
    unzip('mlappkit_static_bundle.zip', install_path);
    addpath(genpath(install_path));
    savepath();
    
    
    fprintf('%s\n', ' Done! mlAppKit was installed in:')
    fprintf('%s\n',   install_path );
    fprintf('%s\n', '  ');
    fprintf('%s\n', ' Next Steps:');
    fprintf('%s\n', '  ');
    fprintf('%s\n', ' target_dir = pwd(); ');
    fprintf('%s\n', ' project_name = ''hello_world''; ');
    fprintf('%s\n', ' mlappkit_quickstart(target_dir, project_name)');
    
    
end
