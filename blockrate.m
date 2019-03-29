%blocking rate
function B = blockrate(rho, m)

    %�@�}�l���ժ����ϥ����q����
    %���b�����Ƹ��j��overflow�y���p����~
    % k = 0:1:m;
    % B = (rho^m)/(factorial(m)*sum((rho.^k)./factorial(k)));

    %�ѷ�https://en.wikipedia.org/wiki/Erlang_(unit)
    %�N�����קאּiteration�Φ�
    
	B=1;
	for k=1:m
		B=((rho*B)/k)/(1+rho*B/k); 
	end
end