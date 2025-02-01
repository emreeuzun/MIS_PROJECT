function [mse, psnr] = calculate_mse_psnr(file1, file2)
% calculate_mse_psnr İki ses dosyası arasındaki MSE ve PSNR'yi hesaplar.
%   [MSE, PSNR] = calculate_mse_psnr(FILE1, FILE2) dosyalarındaki
%   ses sinyallerinin Ortalama Karesel Hatasını (MSE) ve
%   En Yüksek Sinyal Gürültü Oranını (PSNR) döndürür.

% Dosyaların varlığını kontrol et
if ~isfile(file1)
    error('Birinci dosya mevcut değil: %s', file1);
end
if ~isfile(file2)
    error('İkinci dosya mevcut değil: %s', file2);
end

% Ses dosyalarını yükle
try
    [y1, Fs1] = audioread(file1);
    [y2, Fs2] = audioread(file2);
catch ME
    error('Ses dosyası okunurken hata oluştu: %s', ME.message);
end

% Örnekleme hızlarını kontrol et ve eşitle
if Fs1 ~= Fs2
    warning('Dosyalar farklı örnekleme hızlarına sahip. Yeniden örnekleme yapılıyor...');
    y2 = resample(y2, Fs1, Fs2);
end

% Kanalları kontrol et ve stereo ise mono'ya dönüştür
if size(y1, 2) > 1
    y1 = mean(y1, 2); % Stereo sinyali mono'ya çevir
end
if size(y2, 2) > 1
    y2 = mean(y2, 2); % Stereo sinyali mono'ya çevir
end

% Sinyal uzunluklarını eşitle
min_len = min(length(y1), length(y2));
y1 = y1(1:min_len);
y2 = y2(1:min_len);

% Sinyalleri normalizasyon
if max(abs(y1)) ~= 0
    y1 = y1 / max(abs(y1));
end
if max(abs(y2)) ~= 0
    y2 = y2 / max(abs(y2));
end

% MSE Hesaplama
mse = mean((y1 - y2).^2);

% PSNR Hesaplama
if mse == 0
    psnr = Inf; % MSE sıfırsa PSNR sonsuzdur
else
    max_signal = max([max(abs(y1)), max(abs(y2))]); % Maksimum sinyal değeri
    psnr = 10 * log10((max_signal^2) / mse);
end

% Sonuçları yazdır
fprintf('Mean Squared Error (MSE): %.10f\n', mse);
if isinf(psnr)
    fprintf('Peak Signal-to-Noise Ratio (PSNR): Infinity (MSE = 0)\n');
else
    fprintf('Peak Signal-to-Noise Ratio (PSNR): %.4f dB\n', psnr);
end

end
