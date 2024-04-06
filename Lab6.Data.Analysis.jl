using CSV
using DataFrames

# define variables
c = 0.1016  # characteristic length
mu = 1000   # viscosity

# read in data from csv
df = CSV.read("Data/A1.W2RUN10.csv", DataFrame)

# get important values from df
dyn_p_imp = df[!, "DYNAMIC PRESSURE"][1]
atmospheric_p_imp = df[!, "PRESS TS"][1]
temp_f = df[!, "TEMP TS"][1]

# convert to SI units
dyn_p = dyn_p_imp * 47.88                       # from psf to pa
atmospheric_p = atmospheric_p_imp * 6894.76     # from psi to pa
temp_k = (temp_f - 32) * 5 / 9 + 273.15         # from deg f to K

function calculate_rho(p, T; R=287)
    rho = p / (R * T)

    rho
end

function v_from_q(q, rho)
    v = sqrt(2 * q / rho)

    v
end

function calculate_Re(rho, v, c, mu)
    Re = rho * v * c / mu

    Re
end