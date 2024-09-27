-- data cleaning 

select *
from layoffs;

-- 1. remove duplicates
-- 2. standardize the data
-- 3. null values or blank values
-- 4. remove any columns 

-- we have created another table layoffs_staging, insert same data from layoffs because if we clean the data some of the rows and columns gets deleted.
-- you should not do something on raw data because if some mistake happens the raw data will be gone.

create table layoffs_staging
like layoffs;

select * 
from layoffs_staging;

insert layoffs_staging
select * 
from layoffs;

-- 1. remove duplicates

-- date is keyword in mysql. 

select *,
row_number() over(partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
from layoffs_staging;

with duplicate_cte as
(
	select *,
	row_number() over(partition by company, industry, total_laid_off, percentage_laid_off, `date`) as row_num
	from layoffs_staging
)
select *
from duplicate_cte
where row_num>1;

select * 
from layoffs_staging
where company = 'oda';
-- they are no duplicates but similar values, partition over every single column because country is different in above case.

with duplicate_cte as
(
	select *,
	row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
	from layoffs_staging
)
select *
from duplicate_cte
where row_num>1;

select * 
from layoffs_staging
where company = 'casper';

-- duplicates present but we should not remove both/all, one must be present.

with duplicate_cte as
(
	select *,
	row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
	from layoffs_staging
)
delete 
from duplicate_cte
where row_num>1;

-- layoffs_staging -> right click -> copy to clipboard -> create statement -> paste in query tab.

CREATE TABLE `layoffs_staging2` (
  `company` text,
  `location` text,
  `industry` text,
  `total_laid_off` int DEFAULT NULL,
  `percentage_laid_off` text,
  `date` text,
  `stage` text,
  `country` text,
  `funds_raised_millions` int DEFAULT NULL,
  `row_num` int
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

select *
from layoffs_staging2;

-- insert into table_name (recommended) / insert table_name both are working. 
insert layoffs_staging2
select *,
row_number() over(partition by company, location, industry, total_laid_off, percentage_laid_off, `date`, stage, country, funds_raised_millions) as row_num
from layoffs_staging;

select * 
from layoffs_staging2
where row_num>1;

delete 
from layoffs_staging2
where row_num>1;

select *
from layoffs_staging2;

-- 2. standardize the data - find issues and fix it.

select company, trim(company)
from layoffs_staging2;

update layoffs_staging2
set company = trim(company);

select *
from layoffs_staging2;

select distinct industry
from layoffs_staging2
order by 1;
-- Crypto, Crypto Currency, CryptoCurrency all are same.

select *
from layoffs_staging2
where industry like 'crypto%';

update layoffs_staging2
set industry = 'crypto'
where industry like 'crypto%';

 -- first letter in industry is uppercase.
 
update layoffs_staging2
set industry = 'Crypto'
where industry = 'crypto';

select distinct industry
from layoffs_staging2
order by 1;

select distinct location
from layoffs_staging2
order by 1;
-- location is fine 

select distinct country
from layoffs_staging2
order by 1;
-- united states, 'united states.' is presnt need to update.

-- update layoffs_staging2 set country = 'united states' where country like 'united states%';
-- other way 

-- trailing - coming at end
select distinct country, trim(trailing '.' from country)
from layoffs_staging2
order by 1;

update layoffs_staging2
set country = trim(trailing '.' from country)
where country like 'united states%';

select distinct country
from layoffs_staging2
order by 1;

select *
from layoffs_staging2;
-- date - text column, it is not good if we do time series stuff, change it to date column.
-- format 'yyyy-mm-dd'
-- In our date column we have mm/dd/yyyy so we are writing %m/%d/%Y lowercase m and d and uppercase Y.
select `date`,
str_to_date(`date`, '%m/%d/%Y')
from layoffs_staging2;

update layoffs_staging2
set `date` = str_to_date(`date`, '%m/%d/%Y');

select *
from layoffs_staging2;

-- date is still text type (in schemas) but in table column it is in date format, if we convert text to date before it will give error. 

alter table layoffs_staging2
modify column `date` date;
-- date is changed to date (in schemas)

select * 
from layoffs_staging2;

-- 3. null and blank values

-- here dont use =, but use is
select * 
from layoffs_staging2
where total_laid_off is NULL
and percentage_laid_off is NULL;
-- in step 4 remove rows and columns.

select distinct industry
from layoffs_staging2
order by 1;

-- null and blank values.

select *
from layoffs_staging2
where industry is NULL
or industry = '';

update layoffs_staging2
set industry = NULL
where industry = '';

-- if any of them is populated i.e. airbnb has blank and travel for industry so we can populate null with travel.

select *
from layoffs_staging2
where company = 'airbnb';

select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company 
where (t1.industry is NULL or t1.industry = '')
and t2.industry is NOT NULL;

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company 
set t1.industry = t2.industry
where (t1.industry is NULL or t1.industry = '')
and t2.industry is NOT NULL;

-- not updated so update blanks to nulls (before step)

select t1.industry, t2.industry
from layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company 
where (t1.industry is NULL or t1.industry = '')
and t2.industry is NOT NULL;

update layoffs_staging2 t1
join layoffs_staging2 t2
	on t1.company = t2.company 
set t1.industry = t2.industry
where t1.industry is NULL
and t2.industry is NOT NULL;

select *
from layoffs_staging2
where industry is NULL
or industry = '';
-- bally's interactive is still null

select *
from layoffs_staging2
where company like 'bally%';
-- only one row we have.

-- 4. remove rows and columns

select *
from layoffs_staging2;

select * 
from layoffs_staging2
where total_laid_off is NULL
and percentage_laid_off is NULL;

delete 
from layoffs_staging2
where total_laid_off is NULL
and percentage_laid_off is NULL;

select * from layoffs_staging2;

-- remove column row_num
alter table layoffs_staging2
drop column row_num;


