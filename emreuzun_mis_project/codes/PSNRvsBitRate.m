% Veriler
bit_rates = [256, 192, 128, 96]; % Bit rate (kb/s)

% PSNR değerleri
psnr_mp3 = [52.20,51.63,46.44,38.08];
psnr_ogg = [42.35,39.79,35.67,32.16];
psnr_m4a = [48.71,45.84,39.76,39.26];
psnr_opus = [43.83,43.05,40.08,38.12];

% Grafik çizimi
figure;
hold on;
plot(bit_rates, psnr_mp3, '-o', 'LineWidth', 2, 'DisplayName', 'MP3');
plot(bit_rates, psnr_ogg, '-s', 'LineWidth', 2, 'DisplayName', 'OGG');
plot(bit_rates, psnr_m4a, '-^', 'LineWidth', 2, 'DisplayName', 'M4A');
plot(bit_rates, psnr_opus, '-x', 'LineWidth', 2, 'DisplayName', 'Opus');

% Grafik başlıkları ve etiketler
xlabel('Bit Rate (kb/s)', 'FontSize', 12);
ylabel('PSNR (dB)', 'FontSize', 12);
title('PSNR vs. Bit Rate for Different Codecs', 'FontSize', 14);
legend('show', 'Location', 'southwest');
grid on;
hold off;
