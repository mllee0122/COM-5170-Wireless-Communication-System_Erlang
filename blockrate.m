%blocking rate
function B = blockrate(rho, m)

    %一開始嘗試直接使用講義公式
    %但在階乘數較大時overflow造成計算錯誤
    % k = 0:1:m;
    % B = (rho^m)/(factorial(m)*sum((rho.^k)./factorial(k)));

    %參照https://en.wikipedia.org/wiki/Erlang_(unit)
    %將公式修改為iteration形式
    
	B=1;
	for k=1:m
		B=((rho*B)/k)/(1+rho*B/k); 
	end
end