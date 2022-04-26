function [k,s] = Seq(k_d,k_f)
    k=k_d:1:k_f; %Vecteur ligne de k_d a k_f
    s = (0.91).^k; % La sequence voulu
end