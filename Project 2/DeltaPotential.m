function y = DeltaPotential(x)
    pot = zeros(length(x), 1);
    pot(ceil(end/2)) = 1;
    y = pot;
end