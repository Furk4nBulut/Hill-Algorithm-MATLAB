message_str = input('Şifrelemek istediğiniz mesajı girin: ', 's');
key_str = input('Lütfen 2x2 boyutunda bir anahtar matrisi girin: ', 's');
key_nums = sscanf(key_str, '%d %d %d %d');
n = length(message_str);
message_nums = zeros(n, 1);
for i = 1:n
    message_nums(i) = mod(double(message_str(i))-65, 26);
end
if mod(n, 2) == 1
    message_nums(n+1) = 23;
    n = n + 1;
end
message_blocks = reshape(message_nums, 2, n/2)';
key = reshape(key_nums, 2, 2)';
message_blocks = mod(key*message_blocks', 26)';
newmessage = '';
for i = 1:n/2
    newmessage = [newmessage char(message_blocks(i,:)+65)];
end
disp(['Girilen mesaj: ' message_str])
disp(['Şifreli mesaj: ' newmessage])
