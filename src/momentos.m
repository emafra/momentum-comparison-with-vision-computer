function valor = momentos(im, p, q, uc, vc) % Função para calcular os
% momentos.
    valor = 0; 
    i = (im == 1);
    for v = 1 : size(i,1) 
        for u = 1 : size(i,2) 
            valor = valor + ((u - uc)^p)*((v - vc)^q)*i(v,u); 
        end 
    end 
end 