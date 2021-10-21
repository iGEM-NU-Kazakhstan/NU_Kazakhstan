
initCobraToolbox %initialise cobra toolbox
changeCobraSolver('glpk');

%output file - solution vectors
fid = fopen('pputida_flux_output.txt', 'w+');

% %list of compounds tested
for d = {'EX_EC0027','EX_EC0080','EX_Rsuc','EX_EC0148','EX_EC0098','EX_EC3745'},
    fprintf(fid,'\n%s\t',d{1}); 
    load('Supplementary_2_Final_Model.mat');
    model=changeObjective(model,'EX_RHLB')% for biomass object use: EX_EC9324; for rhamnolipids production object use:EX_RHLB  
    model=changeRxnBounds(model,d,-10,'l') %change rxn bound of reaction of interest
    flux=geometricFBA(model) %run geometric FBA
    fprintf(fid,'\t%f',flux) 
end
% 
fclose(fid);


%EX_EC0027 Exchange reaction for glucose - C0027[e]
%EX_EC0080 Exchange reaction for fructose - C0080[e]
%EX_Rsuc Exchange reaction for fructose sucrose - Csuc[e]
%EX_EC0148 Exchange reaction for benzoate - C0148[e]
%EX_EC0098 Exchange reaction for glycerol - C0098[e]
%EX_EC3745 Exchange reaction for myristic acid - C3745[e]
