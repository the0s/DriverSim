load('HMM_ALL_coeff_diff_new_track');
new= all_struct;

load('HMM_ALL_coeff_diff');
old= all_struct;
all_struct=struct('violaris',[],'theo',[],'kotsios',[],'loizos',[],'xristos',[]);

all_struct.violaris = merger(new.violaris, old.violaris);
all_struct.theo = merger(new.theo, old.theo);
all_struct.kotsios = merger(new.kotsios, old.kotsios);
all_struct.loizos = merger(new.loizos, old.loizos);
all_struct.xristos = merger(new.xristos, old.xristos);


