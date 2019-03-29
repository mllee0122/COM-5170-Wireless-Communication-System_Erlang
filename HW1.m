%blocking rate
function B = blockrate(rho, m)

k = 0:1:m;
B = (rho^m)/(factorial(m)*sum((rho.^k)./factorial(k)));

end

function ErlangB(m, BR)

rho_u = 600.0;
rho_l = 0.0;
temp = blockrate(rho_mid, m)

%Applying Bisection Method to Solve rho
while (rho_u-rho_l > 0.0001*max([1 rho_l]))
    
    if(temp > BR)
        rho_mid = rho_u;
    else
        rho_mid = rho_l;
    end
    rho_mid = (rho_u+rho_l)/2;
    temp = blockrate(rho_mid, m)   
    
end
ErlangB(m, BR) = mrho_mid;

end

total_load=zeros();
i=1;
j=1;
for BR = [0.01,0.03,0.05,0.1]
	for m = 1:20
		total_load(i, j) = ErlangB(CN, BR);
        i = i+1;
	end
	j = j+1;
end

xlsFile = 'output01.xls';
data = {'m', '1.0%', '3.0%', '5.0%', '10%' };
xlswrite(xlsFile, total_load);