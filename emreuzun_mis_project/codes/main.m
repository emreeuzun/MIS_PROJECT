
clc
ref  = "sample.wav"; % İlk WAV dosyasının adı
test  = "sample_192k_mp3.wav"; % İkinci WAV dosyasının adı
StartS = 0;                     % Başlangıç örneği
EndS = 44100; 

[mse_degeri, psnr_degeri] = calculate_mse_psnr(ref, test);

