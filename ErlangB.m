function load = ErlangB(m, BR)

    %Applying Bisection Method to Solve rho
    %考慮channel number會帶到220，因此traffic load上界設定為大約兩倍的500
    %由於rho必定非負數，因此設定下界為0
    rho_u = 500 ;
    rho_l = 0.0;
    rho_mid = (rho_u+rho_l)/2;
    temp = blockrate(rho_mid, m);

    while (rho_u-rho_l > 0.0001)
        if(temp > BR)
            rho_u = rho_mid;
        else
            rho_l = rho_mid;
        end
        rho_mid = (rho_u+rho_l)/2;
        temp = blockrate(rho_mid, m);   
    end
    load = rho_mid;
end