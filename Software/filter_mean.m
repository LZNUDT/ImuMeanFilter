function [ y ] = filter_mean( x, n )
% [ y ] = filter_mean( x, n ) ��ֵ�˲�����
% x������
% n������
% ע�⣺������Ϊ��ά����ʱ���������ֵ
if (n == floor(n)) && (n > 0)
    if n > 1
        [line, row] = size(x);
        if line > 1
            if line >= n
               for i = 1 : floor(line / n)
                   y(i, :) = mean(x((((i - 1) * n) + 1) : (i * n), :));
               end
            else
                error('��filter_mean���������ô���');
            end
        else
            if row >= n
                for i = 1 : floor(row / n)
                   y(:, i) = mean(x(:, (((i - 1) * n) + 1) : (i * n)));
               end
            else
                error('��filter_mean���������ô���');
            end
        end
    else
        y = x;
    end
else
    error('��filter_mean���������ô���');
end
