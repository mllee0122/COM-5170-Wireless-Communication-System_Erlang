function load = ErlangB(m, BR)

    %Applying Bisection Method to Solve rho
    %�Ҽ{channel number�|�a��220�A�]��traffic load�W�ɳ]�w���j���⭿��500
    %�ѩ�rho���w�D�t�ơA�]���]�w�U�ɬ�0
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