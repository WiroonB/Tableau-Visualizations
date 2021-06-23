USE Portfolio_Project;

-- 1.Global Numbers
SELECT SUM(new_cases) AS total_cases, SUM(CAST(new_deaths AS INT)) AS total_deaths, SUM(CAST(new_deaths AS INT))/SUM(new_cases)*100 AS DeathPercentage
FROM Covid_Deaths
WHERE continent IS NOT NULL
ORDER BY 1,2;


--2. 
SELECT location, SUM(CAST(new_deaths AS INT)) AS TotalDeathCount
FROM Covid_Deaths
WHERE continent is null 
	and location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY TotalDeathCount DESC;


--3.
SELECT location, population, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
FROM Covid_Deaths
GROUP BY location, population
ORDER BY PercentPopulationInfected desc;



--4.
SELECT location, population, date, MAX(total_cases) as HighestInfectionCount,  Max((total_cases/population))*100 as PercentPopulationInfected
FROM Covid_Deaths
GROUP BY location, population, date
ORDER BY PercentPopulationInfected desc;
