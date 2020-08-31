clc
clear
close all
I = iread('LAB2_FIG.png'); % Captura a imagem a ser processada.
circulo = iread('referencia_circulo.png'); % Captura as formas a serem
% comparadas.
estrela = iread('referencia_estrela.png');
pentagono = iread('referencia_pentagono.png');
quadrado = iread('referencia_quadrado.png');
figure(); idisp(I);
% Calcula momentos centrais:
for i=1:4 % Neste laço serão calculados os momentos necessários de cada 
    % imagem individual (circulo,estrela,pentagono,quadrado) e por fim seus 
    % vetores descritores.
if i==1
im = circulo;
end 
if i==2
im = estrela;
end 
if i==3
im = pentagono;
end 
if i==4
im = quadrado;
end 
 m00(i) = momentos(im, 0, 0, 0, 0); 
 m10(i) = momentos(im, 1, 0, 0, 0); 
 m01(i) = momentos(im, 0, 1, 0, 0);
 uc(i) = m10(i)./m00(i); 
 vc(i) = m01(i)./m00(i); 
 m11(i) = momentos(im, 1, 1, uc(i), vc(i));
 m20(i) = momentos(im, 2, 0, uc(i), vc(i)); 
 m02(i) = momentos(im, 0, 2, uc(i), vc(i));   
 m21(i) = momentos(im, 2, 1, uc(i), vc(i)); 
 m12(i) = momentos(im, 1, 2, uc(i), vc(i));   
 m30(i) = momentos(im, 3, 0, uc(i), vc(i)); 
 m03(i) = momentos(im, 0, 3, uc(i), vc(i));
 Matriz(i,:) = descritor(m00(i),m11(i),m20(i),m02(i),m21(i),m12(i),m30(i),m03(i));
end
[lbl, m, parents, cls] = ilabel(I); 
for i = 1:m % Este laço Calcula os momentos necessários de cada objeto 
    % encontrado na imagem processada, encontra o vetor descritor de cada
    % objeto e por fim compara o vetor descritor encontrado com os vatores
    % descritores atribuidos a Matriz do laço anterior através de uma 
    % relação de módulo das somas dos 7 elementos de cada vetor.
    if cls(i) == 1 
      im = (lbl == i); 
      [v, u] = find(im);
      
      umin = min(u);  
      umax = max(u);
      vmin = min(v); 
      vmax = max(v);
      
      m00 = momentos(im, 0, 0, 0, 0); 
      m10 = momentos(im, 1, 0, 0, 0); 
      m01 = momentos(im, 0, 1, 0, 0);
      uc = m10./m00; 
      vc = m01./m00; 
      m11 = momentos(im, 1, 1, uc, vc);
      m20 = momentos(im, 2, 0, uc, vc); 
      m02 = momentos(im, 0, 2, uc, vc);   
      m21 = momentos(im, 2, 1, uc, vc); 
      m12 = momentos(im, 1, 2, uc, vc);   
      m30 = momentos(im, 3, 0, uc, vc); 
      m03 = momentos(im, 0, 3, uc, vc);
      
      vetor = descritor(m00,m11,m20,m02,m21,m12,m30,m03);
      compara = sqrt((sum(sum(vetor)))^2)
      
      if compara <= 1.01*(sqrt((sum(sum(Matriz(1,:))^2)))) && ...
              compara >= 0.99*(sqrt((sum(sum(Matriz(1,:))^2))))
      plot_box(umin,vmin,umax,vmax, 'g')    
      end
      if compara <= 1.01*(sqrt((sum(sum(Matriz(2,:))^2)))) && ...
              compara >= 0.99*(sqrt((sum(sum(Matriz(2,:))^2))))
      plot_box(umin,vmin,umax,vmax, 'b')    
      end
      if compara <= 1.01*(sqrt((sum(sum(Matriz(3,:))^2)))) && ...
              compara >= 0.99*(sqrt((sum(sum(Matriz(3,:))^2))))
      plot_box(umin,vmin,umax,vmax, 'r')    
      end
      if compara <= 1.01*(sqrt((sum(sum(Matriz(4,:))^2)))) && ...
              compara >= 0.99*(sqrt((sum(sum(Matriz(4,:))^2))))
      plot_box(umin,vmin,umax,vmax, 'm')    
      end         
    end 
end
