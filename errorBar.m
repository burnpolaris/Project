mooreSynError = [0.0386,0.0516,0.0612,0.0614,0.0603,0.0638,0.0562,0.0588,0.0824,0.0837,0.0647,0.0658,0.0904,0.0935]; 
mooreSynMean =  [0.9105,0.8517,0.8308,0.8162,0.8101,0.7513,0.6988,0.7000,0.7239,0.7291,0.3070,0.3046,0.0746,0.0518];

mooreAsyError = [0.1211,0.0887,0.0901,0.0903,0.0901,0.0900,0.0904,0.0900,0.0902,0.0900,0.0900,0.0902,0.0900,0.0901];
mooreAsyMean =  [0.5530,0.1709,0.0136,0.0105,0.0114,0.0101,0.0104,0.0100,0.0100,0.0099,0.0100,0.0100,0.0098,0.0099];

vonNeumannSynError = [0.0213,0.0219,0.0215,0.0219,0.0211,0.0654,0.0635,0.0628,0.0755,0.0752,0.0752,0.0758,0.0742,0.0746];
vonNeumannSynMean =  [0.7261,0.7193,0.7255,0.7218,0.7233,0.4030,0.4012,0.4038,0.2739,0.2641,0.2680,0.2633,0.2855,0.2751];

vonNeumannAsyError = [0.1108,0.1061,0.1099,0.1084,0.1094,0.0682,0.0682,0.0684,0.0926,0.0924,0.0926,0.0928,0.0921,0.0922];
vonNeumannAsyMean =  [0.7419,0.7362,0.7349,0.7386,0.7395,0.2717,0.2666,0.2654,0.0245,0.0242,0.0234,0.0273,0.0266,0.0272];

T = 1.10:0.05:1.75;

subplot(2,2,1)
errorbar(T,mooreSynMean,mooreSynError,'r-o');    
hold on
errorbar(T,mooreAsyMean,mooreAsyError,'b-s'); 
legend('Synchronous','Asynchronous'); 
xlabel('b/T');ylabel('Nc/Ntotal');
title('Moore');

subplot(2,2,2)
errorbar(T,mooreSynMean,mooreSynError,'r-o');    
hold on
errorbar(T,vonNeumannSynMean,vonNeumannSynError,'b-s');
legend('Moore','VonNeumann');
xlabel('b/T');ylabel('Nc/Ntotal');
title('Synchronous');

subplot(2,2,3)
errorbar(T,vonNeumannSynMean,vonNeumannSynError,'r-o');    
hold on
errorbar(T,vonNeumannAsyMean,vonNeumannAsyError,'b-s'); 
legend('Synchronous','Asynchronous'); 
xlabel('b/T');ylabel('Nc/Ntotal');
title('Von Neumann');

subplot(2,2,4)
errorbar(T,mooreAsyMean,mooreAsyError,'r-o');   
hold on
errorbar(T,vonNeumannAsyMean,vonNeumannAsyError,'b-s');
legend('Moore','VonNeumann');
xlabel('b/T');ylabel('Nc/Ntotal');
title('Asynchronous');
