function conversion_launcher()
mlapp2classdef_edit(fullfile('content','etchasketch.mlapp'),'ReplaceAppUI',true);
mlapp2classdef_edit(fullfile('content','pong.mlapp'),'ReplaceAppUI',true);
mlapp2classdef_edit(fullfile('launch','icbm.mlapp'),'ReplaceAppUI',true);
mlapp2classdef_edit(fullfile('launch','scud.mlapp'),'ReplaceAppUI',true);
mlapp2classdef_edit(fullfile('launch','stinger.mlapp'),'ReplaceAppUI',true);
mlapp2classdef_edit(fullfile('popups','popup_about.mlapp'),'ReplaceAppUI',false);
mlapp2classdef_edit(fullfile('popups','popup_settings.mlapp'),'ReplaceAppUI',false);
main_extractor();
end
