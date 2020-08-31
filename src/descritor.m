function vetor = descritor(m00,m11,m20,m02,m21,m12,m30,m03) % Função para
% calcular os vetores descritores.

y1 = 0.5*(1+1)+1; % y11
y2 = 0.5*(2+0)+1; % y20 = y02
y3 = 0.5*(2+1)+1; % y21 = y12
y4 = 0.5*(3+0)+1; % y30 = y03

% Cálculo dos "n" necessários para encotrar o vetor descritor.
n11 = m11/(m00^y1);
n20 = m20/(m00^y2);
n02 = m02/(m00^y2);
n21 = m21/(m00^y3);
n12 = m12/(m00^y3);
n30 = m30/(m00^y4);
n03 = m03/(m00^y4);

% Aplicação das fórmulas apresentadas. 
v(1) = n20 + n02; 
v(2) = (n20 - n02)^2 + 4*n11^2; 
v(3) = (n30 - 3*n12)^2 + (3*n21 - n03)^2; 
v(4) = (n30 + n12)^2 + (n21 + n03)^2;
v(5) = (n30 - 3*n12)*(n30 + n12)*((n30 + n12)^2 - 3*(n21 + n03)^2)... 
           + (3*n21 - n03)*(n21 + n03)*(3*(n30 + n12)^2 - (n21 + n03)^2); 
v(6) = (n20 - n02)*((n30 + n12)^2 - (n21 + n03)^2) + ...
 4*n11*(n30 + n12)*(n21 + n03); 
v(7) = (3*n21 - n03)*(n30 + n12)*((n30 + n12)^2 - 3*(n21 + n03)^2) ... 
           + (3*n12 - n30)*(n21 + n03)*(3*(n30 + n12)^2 - (n21 + n03)^2); 
vetor =[v(1),v(2),v(3),v(4),v(5),v(6),v(7)];
end
