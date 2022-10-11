SELECT * FROM portfolioproject.coviddeaths
order by 3,4;

update portfolioproject.coviddeaths set continent = NULL where continent='';
update portfolioproject.coviddeaths set population = NULL where population='';
update portfolioproject.coviddeaths set total_cases = NULL where total_cases='';
update portfolioproject.coviddeaths set new_cases = NULL where new_cases='';
update portfolioproject.coviddeaths set new_cases_smoothed = NULL where new_cases_smoothed='';
update portfolioproject.coviddeaths set total_deaths = NULL where total_deaths='';
update portfolioproject.coviddeaths set new_deaths = NULL where new_deaths='';
update portfolioproject.coviddeaths set new_deaths_smoothed = NULL where new_deaths_smoothed='';
update portfolioproject.coviddeaths set total_cases_per_million = NULL where total_cases_per_million='';
update portfolioproject.coviddeaths set new_cases_per_million = NULL where new_cases_per_million='';
update portfolioproject.coviddeaths set new_cases_smoothed_per_million = NULL where new_cases_smoothed_per_million='';
update portfolioproject.coviddeaths set total_deaths_per_million = NULL where total_deaths_per_million='';
update portfolioproject.coviddeaths set new_deaths_smoothed_per_million = NULL where new_deaths_smoothed_per_million='';
update portfolioproject.coviddeaths set reproduction_rate = NULL where reproduction_rate='';
update portfolioproject.coviddeaths set icu_patients = NULL where icu_patients='';
update portfolioproject.coviddeaths set icu_patients_per_million = NULL where icu_patients_per_million='';
update portfolioproject.coviddeaths set hosp_patients = NULL where hosp_patients='';
update portfolioproject.coviddeaths set hosp_patients_per_million = NULL where hosp_patients_per_million='';
update portfolioproject.coviddeaths set weekly_icu_admissions = NULL where weekly_icu_admissions='';
update portfolioproject.coviddeaths set weekly_icu_admissions_per_million = NULL where weekly_icu_admissions_per_million='';
update portfolioproject.coviddeaths set weekly_hosp_admissions = NULL where weekly_hosp_admissions='';
update portfolioproject.coviddeaths set weekly_hosp_admissions_per_million = NULL where weekly_hosp_admissions_per_million='';

SELECT * FROM portfolioproject.coviddeaths
order by 3,4;

SELECT location, date, total_cases, new_cases, total_deaths, population
FROM portfolioproject.coviddeaths;

/*Looking at Total cases vs Total Deaths*/
/*Shows likelihood of dying if you are in India and contract COVID*/

SELECT location, date, total_cases, total_deaths, round((total_deaths/total_cases)*100,2) AS Death_percentage
FROM portfolioproject.coviddeaths
WHERE location = 'India';

/*Looking at Total cases vs Population*/
/*Percentage of Population affected from COVID*/

SELECT location, date, total_cases, population, round((total_cases/population)*100,2) AS Population_Affected_Percentage
FROM portfolioproject.coviddeaths
WHERE continent is not null;

/*Countries with Highest Infection Rate*/

SELECT location, MAX(total_cases) as Highest_Infection, population, round((MAX(total_cases)/population)*100,2) AS Population_Affected_Percentage
FROM portfolioproject.coviddeaths
WHERE continent is not null
GROUP BY location, population
order by Population_Affected_Percentage desc;

/*Countries with Highest Death Rate*/

SELECT location, MAX(cast(total_deaths as unsigned)) as Total_Death_Count
FROM portfolioproject.coviddeaths
WHERE continent is not null
GROUP BY location
order by Total_Death_Count desc;

/* LET'S DO IT NOW BY CONTINENT */

/* Continents with Highest Death Count per population */

SELECT continent, MAX(cast(total_deaths as unsigned)) as Total_Death_Count
FROM portfolioproject.coviddeaths
WHERE continent is not null
GROUP BY continent
order by Total_Death_Count desc;

/*Continents with Highest Infection Rate*/

SELECT continent, location, MAX(total_cases) as Highest_Infection, population, round((MAX(total_cases)/population)*100,2) AS Population_Affected_Percentage
FROM portfolioproject.coviddeaths
WHERE continent is not null
GROUP BY continent
order by Population_Affected_Percentage desc;

/* Global Numbers */

SELECT SUM(new_cases), sum(new_deaths), SUM(new_deaths)/SUM(new_cases)*100 as Death_Percentage
FROM portfolioproject.coviddeaths
WHERE continent is not null
-- GROUP BY date
order by 1,2;

Select * FROM portfolioproject.covidvaccinations;

update portfolioproject.covidvaccinations set continent = NULL where continent='';
update portfolioproject.covidvaccinations set total_tests = NULL where total_tests='';
update portfolioproject.covidvaccinations set new_tests = NULL where new_tests='';
update portfolioproject.covidvaccinations set total_tests_per_thousand = NULL where total_tests_per_thousand='';
update portfolioproject.covidvaccinations set new_tests_per_thousand = NULL where new_tests_per_thousand='';
update portfolioproject.covidvaccinations set new_tests_smoothed = NULL where new_tests_smoothed='';
update portfolioproject.covidvaccinations set new_tests_smoothed_per_thousand = NULL where new_tests_smoothed_per_thousand='';
update portfolioproject.covidvaccinations set positive_rate = NULL where positive_rate='';
update portfolioproject.covidvaccinations set tests_per_case = NULL where tests_per_case='';
update portfolioproject.covidvaccinations set tests_units = NULL where tests_units='';
update portfolioproject.covidvaccinations set total_vaccinations = NULL where total_vaccinations='';
update portfolioproject.covidvaccinations set people_vaccinated = NULL where people_vaccinated='';
update portfolioproject.covidvaccinations set people_fully_vaccinated = NULL where people_fully_vaccinated='';
update portfolioproject.covidvaccinations set total_boosters = NULL where total_boosters='';
update portfolioproject.covidvaccinations set new_vaccinations = NULL where new_vaccinations='';
update portfolioproject.covidvaccinations set new_vaccinations_smoothed = NULL where new_vaccinations_smoothed='';
update portfolioproject.covidvaccinations set total_vaccinations_per_hundred = NULL where total_vaccinations_per_hundred='';
update portfolioproject.covidvaccinations set people_vaccinated_per_hundred = NULL where people_vaccinated_per_hundred='';
update portfolioproject.covidvaccinations set people_fully_vaccinated_per_hundred = NULL where people_fully_vaccinated_per_hundred='';
update portfolioproject.covidvaccinations set total_boosters_per_hundred = NULL where total_boosters_per_hundred='';
update portfolioproject.covidvaccinations set new_vaccinations_smoothed_per_million = NULL where new_vaccinations_smoothed_per_million='';
update portfolioproject.covidvaccinations set new_people_vaccinated_smoothed = NULL where new_people_vaccinated_smoothed='';
update portfolioproject.covidvaccinations set new_people_vaccinated_smoothed_per_hundred = NULL where new_people_vaccinated_smoothed_per_hundred='';
update portfolioproject.covidvaccinations set stringency_index = NULL where stringency_index='';
update portfolioproject.covidvaccinations set population_density = NULL where population_density='';
update portfolioproject.covidvaccinations set median_age = NULL where median_age='';
update portfolioproject.covidvaccinations set aged_65_older = NULL where aged_65_older='';
update portfolioproject.covidvaccinations set aged_70_older = NULL where aged_70_older='';
update portfolioproject.covidvaccinations set gdp_per_capita = NULL where gdp_per_capita='';
update portfolioproject.covidvaccinations set extreme_poverty = NULL where extreme_poverty='';
update portfolioproject.covidvaccinations set cardiovasc_death_rate = NULL where cardiovasc_death_rate='';
update portfolioproject.covidvaccinations set diabetes_prevalence = NULL where diabetes_prevalence='';
update portfolioproject.covidvaccinations set female_smokers = NULL where female_smokers='';
update portfolioproject.covidvaccinations set male_smokers = NULL where male_smokers='';
update portfolioproject.covidvaccinations set handwashing_facilities = NULL where handwashing_facilities='';
update portfolioproject.covidvaccinations set hospital_beds_per_thousand = NULL where hospital_beds_per_thousand='';
update portfolioproject.covidvaccinations set life_expectancy = NULL where life_expectancy='';
update portfolioproject.covidvaccinations set human_development_index = NULL where human_development_index='';
update portfolioproject.covidvaccinations set excess_mortality_cumulative_absolute = NULL where excess_mortality_cumulative_absolute='';
update portfolioproject.covidvaccinations set excess_mortality_cumulative = NULL where excess_mortality_cumulative='';
update portfolioproject.covidvaccinations set excess_mortality = NULL where excess_mortality='';
update portfolioproject.covidvaccinations set excess_mortality_cumulative_per_million = NULL where excess_mortality_cumulative_per_million='';

-- Examining Total Population vs Total Vaccinations

select dea.continent, dea.location, dea.date, population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER (partition by dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
    FROM portfolioproject.coviddeaths dea
    JOIN portfolioproject.covidvaccinations vac
        ON dea.location = vac.location
        and dea.date = vac.date
    WHERE dea.continent is not null;

With PopvsVac (continent, location, date, population, new_vaccinations, rolling_people_vaccinated)
as(
    select dea.continent, dea.location, dea.date, population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER (partition by dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
    FROM portfolioproject.coviddeaths dea
    JOIN portfolioproject.covidvaccinations vac
        ON dea.location = vac.location
        and dea.date = vac.date
    WHERE dea.continent is not null
)
SELECT * FROM PopvsVac;
SELECT *, (rolling_people_vaccinated/population)*100
FROM PopvsVac;

-- Temp Table

DROP table if exists PercentPopulationVaccinated;
CREATE table PercentPopulationVaccinated
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
rolling_people_vaccinated numeric
);
INSERT into PercentPopulationvaccinated
select dea.continent, dea.location, dea.date, population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER (partition by dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
    FROM portfolioproject.coviddeaths dea
    JOIN portfolioproject.covidvaccinations vac
        ON dea.location = vac.location
        and dea.date = vac.date;
    -- WHERE dea.continent is not null;
SELECT *, (rolling_people_vaccinated/population)*100
FROM PercentPopulationvaccinated;

-- Creating view

CREATE VIEW PercentPopulationvaccinated as 
select dea.continent, dea.location, dea.date, population, vac.new_vaccinations, SUM(vac.new_vaccinations) OVER (partition by dea.location ORDER BY dea.location, dea.date) AS rolling_people_vaccinated
    FROM portfolioproject.coviddeaths dea
    JOIN portfolioproject.covidvaccinations vac
        ON dea.location = vac.location
        and dea.date = vac.date
    WHERE dea.continent is not null;


