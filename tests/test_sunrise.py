from sunrise import *
from pytest import approx


def test_hour_number_initial():
    """
    Tests the hour at an initial and then
    at day and time zero.
    """
    obs_i = 0.0
    exp_i = hour_number(0,0)
    assert obs_i == exp_i

def test_hour_number_later():
    """
    Tests the hour 365 days later and then
    at time zero.
    """
    obs_one_year = 8760.0
    exp_one_year = hour_number(365,0)
    assert obs_one_year == exp_one_year
    
def test_day_number_initial():
    """
    Tests the day number for the first day
    at the zeroth hour.
    """
    obs_i = 0
    exp_i = day_number(1)
    assert obs_i == exp_i

def test_day_number_later():
    """
    Tests the day number for the 365th day
    at the first hour.
    """
    obs_one_year = 365
    exp_one_year = day_number(hour_number(365,1))
    assert obs_one_year == exp_one_year
    
def test_local_time_initial():
    """
    Tests the local time at time zero.
    """
    obs_i = 0
    exp_i = local_time(0)
    assert obs_i == exp_i

def test_local_time_later():
    """
    Tests the local time at time for the
    365th day at the first hour.
    """
    obs_one_year = 1
    exp_one_year = local_time(8761)
    assert obs_one_year == exp_one_year


def test_frac_year_initial():
    """
    Tests if year fraction is correct for
    time zero on the first day for a non-
    leap year.
    """
    obs_i = -79.89041095890411
    exp_i = frac_year(0)
    assert obs_i == exp_i

def test_frac_year_later():
    """
    Tests if year fraction is correct for
    time zero on the 365th day for a non-
    leap year.
    """
    obs_one_year = 280.1095890410959
    exp_one_year = frac_year(8760)
    assert obs_one_year == exp_one_year
    
def test_frac_year_initial_leap_year():
    """
    Tests if year fraction is correct for
    time zero on the first day for a leap
    year.
    """
    obs_i = -79.67213114754098
    exp_i = frac_year(0, True)
    assert obs_i == exp_i

def test_frac_year_later_leap_year():
    """
    Tests if year fraction is correct for
    time zero on the 365th day for a leap
    year.
    """
    obs_one_year = 280.327868852459
    exp_one_year = frac_year(8784, True)
    assert obs_one_year == exp_one_year

def test_declination_initial():
    """
    Tests the declination for a non-leap
    year at six minutes on the first day.
    The observed value comes from
    https://www.esrl.noaa
    .gov/gmd/grad/solcalc/
    NOAA_Solar_Calculations_day.xls
    where the Latitude was set to 40.066098,
    Longitude to -88.208139, TimeZone to -5,
    Date to 1/1/18, and the six minute declination
    was used.
    """
    obs_i = -23.00214278
    exp_i = declination(0.1)
    assert obs_i == approx(exp_i, 0.073)

def test_declination_later():
    """
    Tests the declination for a non-leap
    year at six minutes on the 365th day.
    The observed value comes from
    https://www.esrl.noaa
    .gov/gmd/grad/solcalc/
    NOAA_Solar_Calculations_day.xls
    where the Latitude was set to 40.066098,
    Longitude to -88.208139, TimeZone to -5,
    Date to 1/1/19, and the six minute declination
    was used.
    """
    obs_one_year = -23.02242734
    exp_one_year = declination(8760.1)
    assert obs_one_year == approx(exp_one_year, 0.073)

def test_declination_initial_leap_year():
    """
    Tests the declination for a leap
    year at six minutes on the first day.
    The observed value comes from
    https://www.esrl.noaa
    .gov/gmd/grad/solcalc/
    NOAA_Solar_Calculations_day.xls
    where the Latitude was set to 40.066098,
    Longitude to -88.208139, TimeZone to -5,
    Date to 1/1/20, and the six minute declination
    was used.
    """
    obs_i = -23.04235228
    exp_i = declination(0.1, True)
    assert obs_i == approx(exp_i, 0.073)

def test_declination_later_leap_year():
    """
    Tests the declination for a leap
    year at six minutes on the 366th day.
    The observed value comes from
    https://www.esrl.noaa
    .gov/gmd/grad/solcalc/
    NOAA_Solar_Calculations_day.xls
    where the Latitude was set to 40.066098,
    Longitude to -88.208139, TimeZone to -5,
    Date to 1/1/21, and the six minute declination
    was used.
    """
    obs_one_year = -22.98164611
    exp_one_year = declination(8784.1, True)
    assert obs_one_year == approx(exp_one_year, 0.073)

def test_equation_of_time_initial():
    """
    Tests the equation of time for a non-leap
    year at six minutes on the first day.
    The observed value comes from
    https://www.esrl.noaa
    .gov/gmd/grad/solcalc/
    NOAA_Solar_Calculations_day.xls
    where the Latitude was set to 40.066098,
    Longitude to -88.208139, TimeZone to -5,
    Date to 1/1/18, and the six minute declination
    was used.
    """
    obs_i = -3.421699572
    exp_i = equation_of_time(0.1)
    assert obs_i == exp_i

def test_equation_of_time_later():
    """
    Tests the equation of time for a non-leap
    year at six minutes on the 365th day.
    The observed value comes from
    https://www.esrl.noaa
    .gov/gmd/grad/solcalc/
    NOAA_Solar_Calculations_day.xls
    where the Latitude was set to 40.066098,
    Longitude to -88.208139, TimeZone to -5,
    Date to 1/1/19, and the six minute declination
    was used.
    """
    obs_one_year = -3.305115384
    exp_one_year = equation_of_time(8760.1)
    assert obs_one_year == exp_one_year

def test_equation_of_time_initial_leap_year():
    """
    Tests the equation of time for a leap
    year at six minutes on the first day.
    The observed value comes from
    https://www.esrl.noaa
    .gov/gmd/grad/solcalc/
    NOAA_Solar_Calculations_day.xls
    where the Latitude was set to 40.066098,
    Longitude to -88.208139, TimeZone to -5,
    Date to 1/1/20, and the six minute declination
    was used.
    """
    obs_i = -3.18827461
    exp_i = equation_of_time(0.1, True)
    assert obs_i == exp_i

def test_equation_of_time_later_leap_year():
    """
    Tests the equation of time for a leap
    year at six minutes on the 366th day.
    The observed value comes from
    https://www.esrl.noaa
    .gov/gmd/grad/solcalc/
    NOAA_Solar_Calculations_day.xls
    where the Latitude was set to 40.066098,
    Longitude to -88.208139, TimeZone to -5,
    Date to 1/1/21, and the six minute declination
    was used.
    """
    obs_one_year = -3.543467339
    exp_one_year = equation_of_time(8784.1, True)
    assert obs_one_year == exp_one_year

def test_local_meridian():
    """
    Tests the local standard
    time meridian for a specific UTC. The
    test was performed with Chicago time
    (UTC-5).
    """
    obs = -75
    exp = local_meridian(-5)
    assert obs == exp

def test_time_correction_initial():
    """
    Tests the time correction for longitude of
    -88.208139, with the lstm for Chicago, and
    the equation of time for a non leap year at
    time zero on the first day.
    """
    obs_i = 4*(-88.208139 - (-75))+(-4.996242884565629)
    exp_i = time_correction(-75, equation_of_time(0), -88.208139)
    assert obs_i == exp_i
    
def test_time_correction_initial():
    """
    Tests the time correction for longitude of
    -88.208139, with the lstm for Chicago, and
    the equation of time for a non leap year at
    time zero on the 365th day.
    """
    obs_one_year = 4*(-88.208139 - (-75))+(-4.996242884565623)
    exp_one_year = time_correction(-75, equation_of_time(8760), -88.208139)
    assert obs_one_year == exp_one_year
    
def test_time_correction_initial_leap_year():
    """
    Tests the time correction for longitude of
    -88.208139, with the lstm for Chicago, and
    the equation of time for a leap year at time
    zero on the first day.
    """
    obs_i = 4*(-88.208139 + 75) + equation_of_time(0,True)
    exp_i = time_correction(-75, equation_of_time(0,True), -88.208139)
    assert obs_i == exp_i

def test_time_correction_later_leap_year():
    """
    Tests the time correction for longitude of
    -88.208139, with the lstm for Chicago, and
    the equation of time for a leap year at
    time zero on the 366th day.
    """
    obs_one_year = 4*(-88.208139 + 75) + equation_of_time(8784,True)
    exp_one_year = time_correction(-75, equation_of_time(8784,True), -88.208139)
    assert obs_one_year == exp_one_year

def test_local_solar_time_initial():
    """
    Tests time correction for Chicago's LSTM at time
    zero of the first day of a non leap year at a
    longitude of -88.208139.
    """
    obs_i = (time_correction(-75, equation_of_time(0), -88.208139))/60 + local_time(0)
    exp_i = local_solar_time(0, time_correction(-75, equation_of_time(0), -88.208139))
    assert obs_i == exp_i

def test_local_solar_time_one_year():
    """
    Tests time correction for Chicago's LSTM at time
    zero of the 365th day of a non leap year at a
    longitude of -88.208139.
    """
    obs_one_year = (time_correction(-75, equation_of_time(8760), -88.208139))/60 + local_time(8760)
    exp_one_year = local_solar_time(local_time(8760), time_correction(-75, equation_of_time(8760), -88.208139))
    assert obs_one_year == exp_one_year

def test_hour_angle_initial():
    """
    Tests hour angle for Chicago's LSTM at time
    zero of the first day of a non leap year at a
    longitude of -88.208139.
    """
    obs_i = 15*(local_solar_time(local_time(0), time_correction(-75, equation_of_time(0), -88.208139))-12)
    exp_i = hour_angle(local_solar_time(local_time(0), time_correction(-75, equation_of_time(0), -88.208139)))
    assert obs_i == exp_i

def test_hour_angle_one_year():
    """
    Tests hour_angle for Chicago's LSTM at time
    zero of the 366th day of a leap year at a
    longitude of -88.208139.
    """
    obs_one_year = 15*(local_solar_time(local_time(8784), time_correction(-75, equation_of_time(8784), -88.208139))-12)
    exp_one_year = hour_angle(local_solar_time(local_time(8784), time_correction(-75, equation_of_time(8784), -88.208139)))
    assert obs_one_year == exp_one_year
    
def test_solar_elevation_initial():
    """
    Tests the solar_elevation for hour_angle
    at Chicago's LSTM, at a longitude of
    -88.20839, latitude of 40.066098,
    declination angle of -23.00214278
    (which corresponds to six minutes into
    the first day of a non leap year).
    """
    obs_i = -69.72488702553723
    exp_i = solar_elevation(-192.95769127319778, -23.00214278, 40.066098)
    assert obs_i == exp_i

def test_solar_elevation_initial():
    """
    Tests the solar_elevation for hour_angle
    at Chicago's LSTM, at a longitude of -88.20839,
    latitude of 40.066098, declination angle of
    -23.001500043978226 (which corresponds to
     six minutes into the 366th day of a leap year).
    """
    obs_i = -69.6706496820568
    exp_i = solar_elevation(-193.07507948090134, -23.001500043978226, 40.066098)
    assert obs_i == exp_i

def test_generate_time_series():
    """
    Tests the generate_time_series for
    hour_angle at Chicago's LSTM at a
    longitude of -88.20839, latitude of
    40.066098, on the first day of a non
    leap year with an hour range of [0.1, 1].
    The observed values were calculated with
    https://www.esrl.noaa.gov/gmd/grad/solcalc/
    NOAA_Solar_Calculations_day.xls set to
    the specifications above.
    """
    obs = [-69.90260457, -72.91478116]
    exp = generate_time_series([0.1,1], 40.066098,-88.20839, -5)
    assert obs == approx(exp, 0.156)