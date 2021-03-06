SCENARIOS = ["lorenz63",
             "48_demand",
             "48_wind",
             "48_solar",
             "48_wind_elevation",
             "48_demand_elevation",
             "48_solar_elevation",
             "48_wind_wettemp",
             "48_solar_wettemp",
             "48_demand_wettemp",
             "48_wind_drytemp",
             "48_solar_drytemp",
             "48_demand_drytemp",
             "48_wind_pressure",
             "48_solar_pressure",
             "48_demand_pressure",
             "48_wind_humidity",
             "48_solar_humidity",
             "48_demand_humidity",
             "48_wind_windspeed",
             "48_solar_windspeed",
             "48_demand_windspeed",
             "04_demand",
             "04_wind",
             "04_solar",
             "04_wind_elevation",
             "04_demand_elevation",
             "04_solar_elevation",
             "04_wind_wettemp",
             "04_solar_wettemp",
             "04_demand_wettemp",
             "04_wind_drytemp",
             "04_solar_drytemp",
             "04_demand_drytemp",
             "04_wind_pressure",
             "04_solar_pressure",
             "04_demand_pressure",
             "04_wind_humidity",
             "04_solar_humidity",
             "04_demand_humidity",
             "04_wind_windspeed",
             "04_solar_windspeed",
             "04_demand_windspeed",]

rule all:
    input:
        expand("data/{scenario}_rho_noise_loss.npy", scenario=SCENARIOS),
        expand("data/{scenario}_n_reservoir_sparsity_loss.npy", scenario=SCENARIOS),
        expand("data/{scenario}_trainlen_loss.npy", scenario=SCENARIOS),
        expand("data/{scenario}_prediction.npy", scenario=SCENARIOS),
        expand("figures/{scenario}_rho_noise_loss.png", scenario=SCENARIOS),
        expand("figures/{scenario}_n_reservoir_sparsity_loss.png", scenario=SCENARIOS),
        expand("figures/{scenario}_trainlen_loss.png", scenario=SCENARIOS),
        expand("figures/{scenario}_prediction.png", scenario=SCENARIOS),

rule optimize_lorenz_63:
    input: "lorenz.py"
    output:
        "data/lorenz63_rho_noise_loss.npy",
        "data/lorenz63_n_reservoir_sparsity_loss.npy",
        "data/lorenz63_trainlen_loss.npy",
        "data/lorenz63_prediction.npy",
        "figures/lorenz63_trainlen_loss.png",
        "figures/lorenz63_prediction.png",
    shell:
        "python lorenz_driver.py -L -S lorenz63"

# ============================================================================
# Standard predictions
# ============================================================================

rule optimize_demand_48:
    input: "data/uiuc_demand_data.csv"
    output:
        "data/48_demand_rho_noise_loss.npy",
        "data/48_demand_n_reservoir_sparsity_loss.npy",
        "data/48_demand_trainlen_loss.npy",
        "data/48_demand_prediction.npy",
        "figures/48_demand_prediction.png",
        "figures/48_demand_trainlen_loss.png",

    shell:
        "python driver.py -i {input} -H 48 -S 48_demand"

rule optimize_wind_48:
    input: "data/railsplitter_data.csv"
    output:
        "data/48_wind_rho_noise_loss.npy",
        "data/48_wind_n_reservoir_sparsity_loss.npy",
        "data/48_wind_trainlen_loss.npy",
        "data/48_wind_prediction.npy",
        "figures/48_wind_prediction.png",
        "figures/48_wind_trainlen_loss.png",
    shell:
        "python driver.py -i {input} -H 48 -S 48_wind"

rule optimize_solar_48:
    input: "data/solarfarm_data.csv"
    output:
        "data/48_solar_rho_noise_loss.npy",
        "data/48_solar_n_reservoir_sparsity_loss.npy",
        "data/48_solar_trainlen_loss.npy",
        "data/48_solar_prediction.npy",
        "figures/48_solar_prediction.png",
        "figures/48_solar_trainlen_loss.png",
    shell:
        "python driver.py -i {input} -H 48 -S 48_solar"

rule optimize_demand_04:
    input: "data/uiuc_demand_data.csv"
    output:
        "data/04_demand_rho_noise_loss.npy",
        "data/04_demand_n_reservoir_sparsity_loss.npy",
        "data/04_demand_trainlen_loss.npy",
        "data/04_demand_prediction.npy",
        "figures/04_demand_prediction.png",
        "figures/04_demand_trainlen_loss.png",
    shell:
        "python driver.py -i {input} -H 4 -S 04_demand"

rule optimize_wind_04:
    input: "data/railsplitter_data.csv"
    output:
        "data/04_wind_rho_noise_loss.npy",
        "data/04_wind_n_reservoir_sparsity_loss.npy",
        "data/04_wind_trainlen_loss.npy",
        "data/04_wind_prediction.npy",
        "figures/04_wind_prediction.png",
        "figures/04_wind_trainlen_loss.png",
    shell:
        "python driver.py -i {input} -H 4 -S 04_wind"

rule optimize_solar_04:
    input: "data/solarfarm_data.csv"
    output:
        "data/04_solar_rho_noise_loss.npy",
        "data/04_solar_n_reservoir_sparsity_loss.npy",
        "data/04_solar_trainlen_loss.npy",
        "figures/04_solar_trainlen_loss.png",
        "data/04_solar_prediction.npy",
        "figures/04_solar_prediction.png",
    shell:
        "python driver.py -i {input} -H 4 -S 04_solar"


# ============================================================================
# Predictions with Solar Elevation
# ============================================================================
rule optimize_demand_elevation_48:
    input: "data/uiuc_demand_data.csv"
    output:
        "data/48_demand_elevation_rho_noise_loss.npy",
        "data/48_demand_elevation_n_reservoir_sparsity_loss.npy",
        "data/48_demand_elevation_trainlen_loss.npy",
        "figures/48_demand_elevation_trainlen_loss.png",
        "data/48_demand_elevation_prediction.npy",
        "figures/48_demand_elevation_prediction.png",
    shell:
        "python driver.py -i {input} -e -H 48 -S 48_demand_elevation"

rule optimize_wind_elevation_48:
    input: "data/railsplitter_data.csv"
    output:
        "data/48_wind_elevation_rho_noise_loss.npy",
        "data/48_wind_elevation_n_reservoir_sparsity_loss.npy",
        "data/48_wind_elevation_trainlen_loss.npy",
        "figures/48_wind_elevation_trainlen_loss.png",
        "data/48_wind_elevation_prediction.npy",
        "figures/48_wind_elevation_prediction.png",
    shell:
        "python driver.py -i {input} -e -H 48 -S 48_wind_elevation"

rule optimize_solar_elevation_48:
    input: "data/solarfarm_data.csv"
    output:
        "data/48_solar_elevation_rho_noise_loss.npy",
        "data/48_solar_elevation_n_reservoir_sparsity_loss.npy",
        "data/48_solar_elevation_trainlen_loss.npy",
        "figures/48_solar_elevation_trainlen_loss.png",
        "data/48_solar_elevation_prediction.npy",
        "figures/48_solar_elevation_prediction.png",
    shell:
        "python driver.py -i {input} -e -H 48 -S 48_solar_elevation"

# ============================================================================
# Predictions with drytemp
# ============================================================================
rule optimize_demand_drytemp_48:
    input:
        demand = "data/uiuc_demand_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/48_demand_drytemp_rho_noise_loss.npy",
        "data/48_demand_drytemp_n_reservoir_sparsity_loss.npy",
        "data/48_demand_drytemp_trainlen_loss.npy",
        "figures/48_demand_drytemp_trainlen_loss.png",
        "data/48_demand_drytemp_prediction.npy",
        "figures/48_demand_drytemp_prediction.png",
    shell:
        "python driver.py -i {input.demand} -f {input.weather} -d -H 48 -S 48_demand_drytemp"

rule optimize_wind_drytemp_48:
    input:
        wind = "data/railsplitter_data.csv",
        weather = "data/lincoln_weatherdata.csv"
    output:
        "data/48_wind_drytemp_rho_noise_loss.npy",
        "data/48_wind_drytemp_n_reservoir_sparsity_loss.npy",
        "data/48_wind_drytemp_trainlen_loss.npy",
        "figures/48_wind_drytemp_trainlen_loss.png",
        "data/48_wind_drytemp_prediction.npy",
        "figures/48_wind_drytemp_prediction.png",
    shell:
        "python driver.py -i {input.wind} -f {input.weather} -d -H 48 -S 48_wind_drytemp"

rule optimize_solar_drytemp_48:
    input:
        solar = "data/solarfarm_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/48_solar_drytemp_rho_noise_loss.npy",
        "data/48_solar_drytemp_n_reservoir_sparsity_loss.npy",
        "data/48_solar_drytemp_trainlen_loss.npy",
        "figures/48_solar_drytemp_trainlen_loss.png",
        "data/48_solar_drytemp_prediction.npy",
        "figures/48_solar_drytemp_prediction.png",
    shell:
        "python driver.py -i {input.solar} -f {input.weather} -d -H 48 -S 48_solar_drytemp"

# ============================================================================
# Predictions with wettemp
# ============================================================================
rule optimize_demand_wettemp_48:
    input:
        demand = "data/uiuc_demand_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/48_demand_wettemp_rho_noise_loss.npy",
        "data/48_demand_wettemp_n_reservoir_sparsity_loss.npy",
        "data/48_demand_wettemp_trainlen_loss.npy",
        "figures/48_demand_wettemp_trainlen_loss.png",
        "data/48_demand_wettemp_prediction.npy",
        "figures/48_demand_wettemp_prediction.png",
    shell:
        "python driver.py -i {input.demand} -f {input.weather} -w -H 48 -S 48_demand_wettemp"

rule optimize_wind_wettemp_48:
    input:
        wind = "data/railsplitter_data.csv",
        weather = "data/lincoln_weatherdata.csv"
    output:
        "data/48_wind_wettemp_rho_noise_loss.npy",
        "data/48_wind_wettemp_n_reservoir_sparsity_loss.npy",
        "data/48_wind_wettemp_trainlen_loss.npy",
        "figures/48_wind_wettemp_trainlen_loss.png",
        "data/48_wind_wettemp_prediction.npy",
        "figures/48_wind_wettemp_prediction.png",
    shell:
        "python driver.py -i {input.wind} -f {input.weather} -w -H 48 -S 48_wind_wettemp"

rule optimize_solar_wettemp_48:
    input:
        solar = "data/solarfarm_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/48_solar_wettemp_rho_noise_loss.npy",
        "data/48_solar_wettemp_n_reservoir_sparsity_loss.npy",
        "data/48_solar_wettemp_trainlen_loss.npy",
        "figures/48_solar_wettemp_trainlen_loss.png",
        "data/48_solar_wettemp_prediction.npy",
        "figures/48_solar_wettemp_prediction.png",
    shell:
        "python driver.py -i {input.solar} -f {input.weather} -w -H 48 -S 48_solar_wettemp"

# ============================================================================
# Predictions with pressure
# ============================================================================
rule optimize_demand_pressure_48:
    input:
        demand = "data/uiuc_demand_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/48_demand_pressure_rho_noise_loss.npy",
        "data/48_demand_pressure_n_reservoir_sparsity_loss.npy",
        "data/48_demand_pressure_trainlen_loss.npy",
        "figures/48_demand_pressure_trainlen_loss.png",
        "data/48_demand_pressure_prediction.npy",
        "figures/48_demand_pressure_prediction.png",
    shell:
        "python driver.py -i {input.demand} -f {input.weather} -p -H 48 -S 48_demand_pressure"

rule optimize_wind_pressure_48:
    input:
        wind = "data/railsplitter_data.csv",
        weather = "data/lincoln_weatherdata.csv"
    output:
        "data/48_wind_pressure_rho_noise_loss.npy",
        "data/48_wind_pressure_n_reservoir_sparsity_loss.npy",
        "data/48_wind_pressure_trainlen_loss.npy",
        "figures/48_wind_pressure_trainlen_loss.png",
        "data/48_wind_pressure_prediction.npy",
        "figures/48_wind_pressure_prediction.png",
    shell:
        "python driver.py -i {input.wind} -f {input.weather} -p -H 48 -S 48_wind_pressure"

rule optimize_solar_pressure_48:
    input:
        solar = "data/solarfarm_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/48_solar_pressure_rho_noise_loss.npy",
        "data/48_solar_pressure_n_reservoir_sparsity_loss.npy",
        "data/48_solar_pressure_trainlen_loss.npy",
        "figures/48_solar_pressure_trainlen_loss.png",
        "data/48_solar_pressure_prediction.npy",
        "figures/48_solar_pressure_prediction.png",
    shell:
        "python driver.py -i {input.solar} -f {input.weather} -p -H 48 -S 48_solar_pressure"

# ============================================================================
# Predictions with humidity
# ============================================================================
rule optimize_demand_humidity_48:
    input:
        demand = "data/uiuc_demand_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/48_demand_humidity_rho_noise_loss.npy",
        "data/48_demand_humidity_n_reservoir_sparsity_loss.npy",
        "data/48_demand_humidity_trainlen_loss.npy",
        "figures/48_demand_humidity_trainlen_loss.png",
        "data/48_demand_humidity_prediction.npy",
        "figures/48_demand_humidity_prediction.png",
    shell:
        "python driver.py -i {input.demand} -f {input.weather} -h -H 48 -S 48_demand_humidity"

rule optimize_wind_humidity_48:
    input:
        wind = "data/railsplitter_data.csv",
        weather = "data/lincoln_weatherdata.csv"
    output:
        "data/48_wind_humidity_rho_noise_loss.npy",
        "data/48_wind_humidity_n_reservoir_sparsity_loss.npy",
        "data/48_wind_humidity_trainlen_loss.npy",
        "figures/48_wind_humidity_trainlen_loss.png",
        "data/48_wind_humidity_prediction.npy",
        "figures/48_wind_humidity_prediction.png",
    shell:
        "python driver.py -i {input.wind} -f {input.weather} -h -H 48 -S 48_wind_humidity"

rule optimize_solar_humidity_48:
    input:
        solar = "data/solarfarm_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/48_solar_humidity_rho_noise_loss.npy",
        "data/48_solar_humidity_n_reservoir_sparsity_loss.npy",
        "data/48_solar_humidity_trainlen_loss.npy",
        "figures/48_solar_humidity_trainlen_loss.png",
        "data/48_solar_humidity_prediction.npy",
        "figures/48_solar_humidity_prediction.png",
    shell:
        "python driver.py -i {input.solar} -f {input.weather} -h -H 48 -S 48_solar_humidity"

# ============================================================================
# Predictions with windspeed
# ============================================================================
rule optimize_demand_windspeed_48:
    input:
        demand = "data/uiuc_demand_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/48_demand_windspeed_rho_noise_loss.npy",
        "data/48_demand_windspeed_n_reservoir_sparsity_loss.npy",
        "data/48_demand_windspeed_trainlen_loss.npy",
        "figures/48_demand_windspeed_trainlen_loss.png",
        "data/48_demand_windspeed_prediction.npy",
        "figures/48_demand_windspeed_prediction.png",
    shell:
        "python driver.py -i {input.demand} -f {input.weather} -u -H 48 -S 48_demand_windspeed"

rule optimize_wind_windspeed_48:
    input:
        wind = "data/railsplitter_data.csv",
        weather = "data/lincoln_weatherdata.csv"
    output:
        "data/48_wind_windspeed_rho_noise_loss.npy",
        "data/48_wind_windspeed_n_reservoir_sparsity_loss.npy",
        "data/48_wind_windspeed_trainlen_loss.npy",
        "figures/48_wind_windspeed_trainlen_loss.png",
        "data/48_wind_windspeed_prediction.npy",
        "figures/48_wind_windspeed_prediction.png",
    shell:
        "python driver.py -i {input.wind} -f {input.weather} -u -H 48 -S 48_wind_windspeed"

rule optimize_solar_windspeed_48:
    input:
        solar = "data/solarfarm_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/48_solar_windspeed_rho_noise_loss.npy",
        "data/48_solar_windspeed_n_reservoir_sparsity_loss.npy",
        "data/48_solar_windspeed_trainlen_loss.npy",
        "figures/48_solar_windspeed_trainlen_loss.png",
        "data/48_solar_windspeed_prediction.npy",
        "figures/48_solar_windspeed_prediction.png",
    shell:
        "python driver.py -i {input.solar} -f {input.weather} -u -H 48 -S 48_solar_windspeed"

#========================= Predictions with 4 hour window ====================
# ============================================================================
# Predictions with Solar Elevation
# ============================================================================
rule optimize_demand_elevation_04:
    input: "data/uiuc_demand_data.csv"
    output:
        "data/04_demand_elevation_rho_noise_loss.npy",
        "data/04_demand_elevation_n_reservoir_sparsity_loss.npy",
        "data/04_demand_elevation_trainlen_loss.npy",
        "figures/04_demand_elevation_trainlen_loss.png",
        "data/04_demand_elevation_prediction.npy",
        "figures/04_demand_elevation_prediction.png",
    shell:
        "python driver.py -i {input} -e -H 4 -S 04_demand_elevation"

rule optimize_wind_elevation_04:
    input: "data/railsplitter_data.csv"
    output:
        "data/04_wind_elevation_rho_noise_loss.npy",
        "data/04_wind_elevation_n_reservoir_sparsity_loss.npy",
        "data/04_wind_elevation_trainlen_loss.npy",
        "figures/04_wind_elevation_trainlen_loss.png",
        "data/04_wind_elevation_prediction.npy",
        "figures/04_wind_elevation_prediction.png",
    shell:
        "python driver.py -i {input} -e -H 4 -S 04_wind_elevation"

rule optimize_solar_elevation_04:
    input: "data/solarfarm_data.csv"
    output:
        "data/04_solar_elevation_rho_noise_loss.npy",
        "data/04_solar_elevation_n_reservoir_sparsity_loss.npy",
        "data/04_solar_elevation_trainlen_loss.npy",
        "data/04_solar_elevation_prediction.npy",
        "figures/04_solar_elevation_trainlen_loss.png",
        "figures/04_solar_elevation_prediction.png",
    shell:
        "python driver.py -i {input} -e -H 4 -S 04_solar_elevation"

# ============================================================================
# Predictions with drytemp
# ============================================================================
rule optimize_demand_drytemp_04:
    input:
        demand = "data/uiuc_demand_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/04_demand_drytemp_rho_noise_loss.npy",
        "data/04_demand_drytemp_n_reservoir_sparsity_loss.npy",
        "data/04_demand_drytemp_trainlen_loss.npy",
        "figures/04_demand_drytemp_trainlen_loss.png",
        "data/04_demand_drytemp_prediction.npy",
        "figures/04_demand_drytemp_prediction.png",
    shell:
        "python driver.py -i {input.demand} -f {input.weather} -d -H 4 -S 04_demand_drytemp"

rule optimize_wind_drytemp_04:
    input:
        wind = "data/railsplitter_data.csv",
        weather = "data/lincoln_weatherdata.csv"
    output:
        "data/04_wind_drytemp_rho_noise_loss.npy",
        "data/04_wind_drytemp_n_reservoir_sparsity_loss.npy",
        "data/04_wind_drytemp_trainlen_loss.npy",
        "figures/04_wind_drytemp_trainlen_loss.png",
        "data/04_wind_drytemp_prediction.npy",
        "figures/04_wind_drytemp_prediction.png",
    shell:
        "python driver.py -i {input.wind} -f {input.weather} -d -H 4 -S 04_wind_drytemp"

rule optimize_solar_drytemp_04:
    input:
        solar = "data/solarfarm_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/04_solar_drytemp_rho_noise_loss.npy",
        "data/04_solar_drytemp_n_reservoir_sparsity_loss.npy",
        "data/04_solar_drytemp_trainlen_loss.npy",
        "figures/04_solar_drytemp_trainlen_loss.png",
        "data/04_solar_drytemp_prediction.npy",
        "figures/04_solar_drytemp_prediction.png",
    shell:
        "python driver.py -i {input.solar} -f {input.weather} -d -H 4 -S 04_solar_drytemp"

# ============================================================================
# Predictions with wettemp
# ============================================================================
rule optimize_demand_wettemp_04:
    input:
        demand = "data/uiuc_demand_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/04_demand_wettemp_rho_noise_loss.npy",
        "data/04_demand_wettemp_n_reservoir_sparsity_loss.npy",
        "data/04_demand_wettemp_trainlen_loss.npy",
        "figures/04_demand_wettemp_trainlen_loss.png",
        "data/04_demand_wettemp_prediction.npy",
        "figures/04_demand_wettemp_prediction.png",
    shell:
        "python driver.py -i {input.demand} -f {input.weather} -w -H 4 -S 04_demand_wettemp"

rule optimize_wind_wettemp_04:
    input:
        wind = "data/railsplitter_data.csv",
        weather = "data/lincoln_weatherdata.csv"
    output:
        "data/04_wind_wettemp_rho_noise_loss.npy",
        "data/04_wind_wettemp_n_reservoir_sparsity_loss.npy",
        "data/04_wind_wettemp_trainlen_loss.npy",
        "figures/04_wind_wettemp_trainlen_loss.png",
        "data/04_wind_wettemp_prediction.npy",
        "figures/04_wind_wettemp_prediction.png",
    shell:
        "python driver.py -i {input.wind} -f {input.weather} -w -H 4 -S 04_wind_wettemp"

rule optimize_solar_wettemp_04:
    input:
        solar = "data/solarfarm_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/04_solar_wettemp_rho_noise_loss.npy",
        "data/04_solar_wettemp_n_reservoir_sparsity_loss.npy",
        "data/04_solar_wettemp_trainlen_loss.npy",
        "figures/04_solar_wettemp_trainlen_loss.png",
        "data/04_solar_wettemp_prediction.npy",
        "figures/04_solar_wettemp_prediction.png",
    shell:
        "python driver.py -i {input.solar} -f {input.weather} -w -H 4 -S 04_solar_wettemp"

# ============================================================================
# Predictions with pressure
# ============================================================================
rule optimize_demand_pressure_04:
    input:
        demand = "data/uiuc_demand_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/04_demand_pressure_rho_noise_loss.npy",
        "data/04_demand_pressure_n_reservoir_sparsity_loss.npy",
        "data/04_demand_pressure_trainlen_loss.npy",
        "figures/04_demand_pressure_trainlen_loss.png",
        "data/04_demand_pressure_prediction.npy",
        "figures/04_demand_pressure_prediction.png",
    shell:
        "python driver.py -i {input.demand} -f {input.weather} -p -H 4 -S 04_demand_pressure"

rule optimize_wind_pressure_04:
    input:
        wind = "data/railsplitter_data.csv",
        weather = "data/lincoln_weatherdata.csv"
    output:
        "data/04_wind_pressure_rho_noise_loss.npy",
        "data/04_wind_pressure_n_reservoir_sparsity_loss.npy",
        "data/04_wind_pressure_trainlen_loss.npy",
        "figures/04_wind_pressure_trainlen_loss.png",
        "data/04_wind_pressure_prediction.npy",
        "figures/04_wind_pressure_prediction.png",
    shell:
        "python driver.py -i {input.wind} -f {input.weather} -p -H 4 -S 04_wind_pressure"

rule optimize_solar_pressure_04:
    input:
        solar = "data/solarfarm_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/04_solar_pressure_rho_noise_loss.npy",
        "data/04_solar_pressure_n_reservoir_sparsity_loss.npy",
        "data/04_solar_pressure_trainlen_loss.npy",
        "figures/04_solar_pressure_trainlen_loss.png",
        "data/04_solar_pressure_prediction.npy",
        "figures/04_solar_pressure_prediction.png",
    shell:
        "python driver.py -i {input.solar} -f {input.weather} -p -H 4 -S 04_solar_pressure"

# ============================================================================
# Predictions with humidity
# ============================================================================
rule optimize_demand_humidity_04:
    input:
        demand = "data/uiuc_demand_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/04_demand_humidity_rho_noise_loss.npy",
        "data/04_demand_humidity_n_reservoir_sparsity_loss.npy",
        "data/04_demand_humidity_trainlen_loss.npy",
        "figures/04_demand_humidity_trainlen_loss.png",
        "data/04_demand_humidity_prediction.npy",
        "figures/04_demand_humidity_prediction.png",
    shell:
        "python driver.py -i {input.demand} -f {input.weather} -h -H 4 -S 04_demand_humidity"

rule optimize_wind_humidity_04:
    input:
        wind = "data/railsplitter_data.csv",
        weather = "data/lincoln_weatherdata.csv"
    output:
        "data/04_wind_humidity_rho_noise_loss.npy",
        "data/04_wind_humidity_n_reservoir_sparsity_loss.npy",
        "data/04_wind_humidity_trainlen_loss.npy",
        "figures/04_wind_humidity_trainlen_loss.png",
        "data/04_wind_humidity_prediction.npy",
        "figures/04_wind_humidity_prediction.png",
    shell:
        "python driver.py -i {input.wind} -f {input.weather} -h -H 4 -S 04_wind_humidity"

rule optimize_solar_humidity_04:
    input:
        solar = "data/solarfarm_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/04_solar_humidity_rho_noise_loss.npy",
        "data/04_solar_humidity_n_reservoir_sparsity_loss.npy",
        "data/04_solar_humidity_trainlen_loss.npy",
        "figures/04_solar_humidity_trainlen_loss.png",
        "data/04_solar_humidity_prediction.npy",
        "figures/04_solar_humidity_prediction.png",
    shell:
        "python driver.py -i {input.solar} -f {input.weather} -h -H 4 -S 04_solar_humidity"

# ============================================================================
# Predictions with windspeed
# ============================================================================
rule optimize_demand_windspeed_04:
    input:
        demand = "data/uiuc_demand_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/04_demand_windspeed_rho_noise_loss.npy",
        "data/04_demand_windspeed_n_reservoir_sparsity_loss.npy",
        "data/04_demand_windspeed_trainlen_loss.npy",
        "figures/04_demand_windspeed_trainlen_loss.png",
        "data/04_demand_windspeed_prediction.npy",
        "figures/04_demand_windspeed_prediction.png",
    shell:
        "python driver.py -i {input.demand} -f {input.weather} -u -H 4 -S 04_demand_windspeed"

rule optimize_wind_windspeed_04:
    input:
        wind = "data/railsplitter_data.csv",
        weather = "data/lincoln_weatherdata.csv"
    output:
        "data/04_wind_windspeed_rho_noise_loss.npy",
        "data/04_wind_windspeed_n_reservoir_sparsity_loss.npy",
        "data/04_wind_windspeed_trainlen_loss.npy",
        "figures/04_wind_windspeed_trainlen_loss.png",
        "data/04_wind_windspeed_prediction.npy",
        "figures/04_wind_windspeed_prediction.png",
    shell:
        "python driver.py -i {input.wind} -f {input.weather} -u -H 4 -S 04_wind_windspeed"

rule optimize_solar_windspeed_04:
    input:
        solar = "data/solarfarm_data.csv",
        weather = "data/champaign_weatherdata.csv"
    output:
        "data/04_solar_windspeed_rho_noise_loss.npy",
        "data/04_solar_windspeed_n_reservoir_sparsity_loss.npy",
        "data/04_solar_windspeed_trainlen_loss.npy",
        "figures/04_solar_windspeed_trainlen_loss.png",
        "data/04_solar_windspeed_prediction.npy",
        "figures/04_solar_windspeed_prediction.png",
    shell:
        "python driver.py -i {input.solar} -f {input.weather} -u -H 4 -S 04_solar_windspeed"

# ============================================================================
# Produce Loss Plots
# ============================================================================
rule make_loss_plots_01:
    input:
        data = "data/{scenario}_rho_noise_loss.npy"
    output:
        "figures/{scenario}_rho_noise_loss.png",
    shell:
        "python loss_plots.py -i {input.data}"

rule make_loss_plots_02:
    input:
        data = "data/{scenario}_n_reservoir_sparsity_loss.npy",
    output:
        "figures/{scenario}_n_reservoir_sparsity_loss.png",
    shell:
        "python loss_plots.py -i {input.data}"
