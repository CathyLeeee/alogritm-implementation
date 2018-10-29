

function nmi = calNMI(label, estimated_label)

N = length(label);
C = max(max(label), max(estimated_label));

mi = 0;
eps = 0.0001;
for s = 1:C %  label
    for t = 1:C %  estimated_label
        I_s = label == s;
        I_t = estimated_label == t;
        n_s = sum(I_s);
        n_t = sum(I_t);
        n_st = sum(I_s .* I_t);
        mi = mi + n_st * (log(N * n_st + eps) - log(n_s * n_t + eps));
    end
end

df_s = 0;
df_t = 0;
for i = 1:C
    n_s = sum(label == i);
    n_t = sum(estimated_label == i);
    df_s = df_s + n_s * log(n_s / N + eps);
    df_t = df_t + n_t * log(n_t / N + eps);
end

nmi = mi / sqrt(df_s * df_t);

end
