CREATE DATABASE WorldEvents
GO

-- switch to it
USE WorldEvents
GO

-- create the tables
CREATE TABLE tblCategory (
	CategoryID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CategoryName nvarchar(255) NULL
)

GO
CREATE TABLE tblContinent(
	ContinentID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	ContinentName nvarchar(255) NULL
)

GO
CREATE TABLE tblCountry(
	CountryID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	CountryName nvarchar(255) NULL,
	ContinentID int NULL
)

GO
CREATE TABLE tblEvent(
	EventID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	EventName varchar(8000) NULL,
	EventDetails varchar(max) NULL,
	EventDate date NULL,
	CountryID int NULL,
	CategoryID int NULL
) 

GO

-- create one example view
CREATE VIEW vwEvents
AS
SELECT        
	-- country and continent
	cn.ContinentName AS Continent, 
	cy.CountryName AS Country,

	-- events
	ev.EventId,
	ev.EventName, 
	ev.EventDetails, 
	ev.EventDate, 

	-- category
	cat.CategoryName AS Category
FROM            
	tblCountry AS cy
	INNER JOIN tblContinent AS cn ON cy.ContinentID = cn.ContinentID 
	INNER JOIN tblEvent AS ev ON cy.CountryID = ev.CountryID 
	INNER JOIN tblCategory AS cat ON ev.CategoryID = cat.CategoryID


GO

-- add the categories
SET IDENTITY_INSERT tblCategory ON 

GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (1, N'Politics')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (2, N'Alien life')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (3, N'Exploration')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (4, N'Natural world')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (5, N'Death and disaster')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (6, N'War and conflict')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (7, N'Sports')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (8, N'Economy')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (9, N'Entertainment and culture')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (10, N'Health and medicine')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (11, N'Love and relationships')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (12, N'Science and technology')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (13, N'Old')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (14, N'Transport')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (15, N'Energy')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (16, N'Royalty and monarchy')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (17, N'Crime and legal')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (18, N'Religion')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (19, N'Education')
GO
INSERT tblCategory (CategoryID, CategoryName) VALUES (20, N'General')
GO
SET IDENTITY_INSERT tblCategory OFF
GO

-- add the continents
SET IDENTITY_INSERT tblContinent ON 

GO
INSERT tblContinent (ContinentID, ContinentName) VALUES (1, N'Asia')
GO
INSERT tblContinent (ContinentID, ContinentName) VALUES (2, N'Africa')
GO
INSERT tblContinent (ContinentID, ContinentName) VALUES (3, N'Europe')
GO
INSERT tblContinent (ContinentID, ContinentName) VALUES (4, N'Australasia')
GO
INSERT tblContinent (ContinentID, ContinentName) VALUES (5, N'South America')
GO
INSERT tblContinent (ContinentID, ContinentName) VALUES (6, N'North America')
GO
INSERT tblContinent (ContinentID, ContinentName) VALUES (7, N'Antarctic')
GO
INSERT tblContinent (ContinentID, ContinentName) VALUES (8, N'Not applicable')
GO
SET IDENTITY_INSERT tblContinent OFF
GO
SET IDENTITY_INSERT tblCountry ON 

GO

-- add the countries
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (1, N'Ukraine', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (2, N'France', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (3, N'Germany', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (4, N'Italy', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (5, N'United States', 6)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (6, N'Bosnia and Herzegovina', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (7, N'United Kingdom', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (8, N'Japan', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (9, N'Indonesia', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (10, N'Vietnam', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (11, N'Russia', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (12, N'Switzerland', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (13, N'Space', 8)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (14, N'Argentina', 5)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (15, N'Antarctica', 7)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (16, N'Belgium', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (17, N'Egypt', 2)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (18, N'Ghana', 2)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (19, N'China', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (20, N'Not set', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (21, N'International', 8)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (22, N'Marshall Islands', 4)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (23, N'Iraq', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (24, N'India', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (25, N'South Korea', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (26, N'Nepal', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (27, N'Austria', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (28, N'Hungary', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (29, N'South Africa', 2)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (30, N'Cuba', 6)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (31, N'Zimbabwe', 2)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (32, N'Australia', 4)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (33, N'Sweden', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (34, N'Bolivia', 5)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (35, N'Sri Lanka', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (36, N'Spain', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (41, N'Netherlands', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (42, N'Singapore', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (43, N'Vatican City', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (37, N'Iran', 1)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (38, N'Ireland', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (39, N'Luxembourg', 3)
GO
INSERT tblCountry (CountryID, CountryName, ContinentID) VALUES (40, N'Lebanon', 1)
GO
SET IDENTITY_INSERT tblCountry OFF
GO
SET IDENTITY_INSERT tblEvent ON 

GO

-- add the events
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (1, N'Chernobyl', N'Reactor 4 at a nuclear power plant in Chernobyl, Ukraine exploded, blowing the 1,000 ton cover off the top of the reactor.', CAST(N'1986-04-26' AS Date), 1, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (2, N'Pearl Harbour', N'Japan launched an attack dubbed ‘Operation Z’ on Pearl Harbour, a United States naval base in Hawaii. The U.S. declared war on Japan the following day, bringing them into World War II.', CAST(N'1941-12-07' AS Date), 5, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (3, N'World War 1 began', N'Often referred to as The Great War, World War I resulted in the death of over 16 million combatants and civilians. The catalyst that spurred the outbreak of fighting was the assassination of Archduke Franz Ferdinand of Austria-Hungary in June 1914, which took place in Sarajevo on 28th June, a month earlier.', CAST(N'1914-07-28' AS Date), 6, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (4, N'World War 1 ends', N'The first world war ended on what is now known as Armistice Day or Remembrance Day.  The armistice was signed in Compiegne in France.', CAST(N'1918-11-11' AS Date), 2, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (5, N'The UK declares war on Germany', N'Following Germany''s invasion of Poland, the UK''s Prime Minister Neville Chamberlain concluded a speech with the words "I have to tell you now that no such undertaking has been received and that consequently this country is at war with Germany."', CAST(N'1939-09-03' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (6, N'Liberation of Bergen-Belsen', N'Up to 60,000 prisoners were liberated by the British 11th Armoured Division, although many subsequently died.', CAST(N'1945-04-15' AS Date), 3, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (7, N'World War II ends', N'Japanese representatives aboard the USS Missouri surrender, in effect ending World War II.', CAST(N'1945-09-02' AS Date), 8, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (8, N'Hiroshima', N'The United States dropped an atomic bomb on the city of Hiroshima (Nagasaki followed 3 days later), leading to Japan''s surrender, ending World War II.  At least 129,000 people were killed.', CAST(N'1945-08-06' AS Date), 8, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (9, N'Asian tsunami', N'An earthquake of magniture 9.1-9.3 occurred, with the epicentre off the west coast of Sumatra, Indonesia, killing 230,000 people in 14 countries.', CAST(N'2004-12-26' AS Date), 21, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (10, N'Liberation/fall of Saigon', N'The People''s Army of Vietnam and the National Liberation Front of South Vietnam captured the capital of the south of the country, ending the Vietnam War', CAST(N'1975-04-30' AS Date), 10, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (11, N'9/11 attacks', N'Two hijacked planes crashed into the twin towers of the world trade centre, killing over 3,000 people  (among them over 400 firefighters and police officers).', CAST(N'2001-09-11' AS Date), 5, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (12, N'Brexit vote', N'By a narrow majority Britain votes to leave the European Union (England and Wales voted to leave, although Scotland and Northern Ireland voted to remain).', CAST(N'2016-06-23' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (13, N'London Olympic games', N'Widely considered a success, the London Olympics started on 27th July with an opening ceremony which included the Spice Girls and a dramatisation of the NHS.', CAST(N'2012-07-27' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (14, N'Lehman Brothers collapses', N'Financial services firm Lehman Brothers filed for Chapter 11 bankruptcy protection on this date.  The filing remains the largest bankruptcy filing in U.S. history, with Lehman holding over $600 billion in assets.', CAST(N'2008-09-15' AS Date), 5, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (15, N'Last edition of "Top of the Pops"', N'The last edition of "Top of the Pops" is broadcast.  The show was hosted by Jimmy Savile, subsquently to be disgraced as a serial sex offender.', CAST(N'2006-07-30' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (16, N'London Eye opens', N'The London Eye is a giant Ferris wheel on the South Bank of the River Thames in London, built to celebrate the millennium (although it opened late).', CAST(N'2000-03-09' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (17, N'First Harry Potter Book published', N'Harry Potter and the Philosopher''s Stone was first published, the first of an eventual series of 7 by the authoress JK Rowling', CAST(N'1997-07-30' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (18, N'Teletubbies first broadcast', N'Tinky-Winky, Dipsy, Laa Laa and Po (not forgetting Nu Nu, the vacuum cleaner) first hit the UK''s television screens on this momentous date in history.', CAST(N'1997-03-31' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (19, N'Channel Tunnel opens', N'The Channel Tunnel was officially opened, one year later than originally planned, by Queen Elizabeth II and the French president, François Mitterrand, in a ceremony held in Calais on this date.', CAST(N'1994-05-06' AS Date), 2, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (20, N'Premier League starts', N'The first season ended (as it did 11 times subsequently) with Alex Ferguson ’s Mancheser United taking the trophy. Teddy Sheringham finished as top scorer with 22 goals (one for Nottingham Forest , 21 for Spurs ).', CAST(N'1992-08-15' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (21, N'Margaret Thatcher resigns', N'Rather than face a humiliating second round of the Conservative Party leadership election, Margraret Thatcher bows out after 11 years in government.', CAST(N'1990-11-22' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (22, N'Coup attempt in Russia', N'The 1991 Soviet coup d''état attempt, also known as the August Putsch or August Coup, was an attempt by members of the Soviet Union''s government to take control of the country from Soviet president Mikhail Gorbachev.', CAST(N'1991-08-19' AS Date), 11, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (23, N'Google launched', N'Google filed for incorporation in California on this date, bringing a new verb to the English language.', CAST(N'1998-09-04' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (24, N'Hillsborough', N'96 people died in the crowd gathered to watch a football match between Liverpool and Nottingham Forest  Lord Justice Taylor’s report on the disaster subsequently found there had been a series of problems leading to the huge death toll.', CAST(N'1989-04-15' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (25, N'World Wide Web launched', N'On this date Tim Berners-Lee and Robert Cailliau, a Belgian engineer, issued a formal detailed proposal for a project, the acceptance of which initiated The Web.', CAST(N'1990-11-12' AS Date), 12, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (26, N'Great Storm of 1987', N'After Michael Fish (the weatherman) memorably dismisses the chances of a severe storm causing problems, Sevenoaks becomes NoOaks and powerful winds cause chaos in the South-East of England.', CAST(N'1987-10-15' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (27, N'M25 opens', N'The last stage of the M25, London''s orbital motorway, opened on this date, ensuring traffic jams for years to come.', CAST(N'1986-10-29' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (28, N'Live Aid', N'Bob Geldof organises a host of celebrities to play at Wembley Stadium to raise money to alleviate hunger in Africa - by common consent Queen steal the show.', CAST(N'1985-07-13' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (29, N'Miners'' strike starts', N'Arthur Scargill begins a coal miners'' strike which leads to bitter confrontations between miners and police, most notably at the Orgreave coking works', CAST(N'1984-06-18' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (30, N'Shergar kidnapped', N'The racehorse Shergar was kidnapped (presumably being held in the same place as Lord Lucan, who disappeared from public life somewhat earlier).', CAST(N'1983-02-08' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (32, N'Monty Python first broadcast', N'John Cleese, Michael Palin, Terry Jones, Terry Gilliam, Graham Chapman and Eric Idle launch Monty Python''s Flying Circus on TV.  They''re all naughty boys!', CAST(N'1969-10-05' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (33, N'Decimalisation', N'Britain says goodbye to base 12 currency and thruppeny bits, when 12 old pennies suddenly became worth 5 new ones.', CAST(N'1971-02-15' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (34, N'Bloody Sunday', N'At a civil rights march in Derry, 30th January, 1972, thirteen people were shot dead (a fourteenth would die months later in hospital).', CAST(N'1972-01-30' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (35, N'Britain joins the EEC', N'On this date, Britain (along with Ireland and Denmark) joined the European Community, as it was then called.  In Britain''s case, temporarily it would seem …', CAST(N'1973-01-01' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (36, N'Microsoft founded', N'Microsoft ((the first version was hyphenated as Micro-Soft) was founded on this date by Bill Gates (who was 19 at the time) and Paul Allen (who was 22).  Curiously, the company didn''t crash and have to be re-booted.', CAST(N'1975-04-04' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (37, N'Fawlty Towers first broadcast', N'John Cleese''s Basil Fawlty entered the UK culture, as did the late Andrew Sachs''s Manuel.  Or should that be "Manuel!"?', CAST(N'1975-09-19' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (39, N'First test-tube baby', N'Louise Joy Brown born in Oldham, weighing 5lb 12oz.  Patrick Steptoe, a consultant gynaecologist, and Robert Edwards, a research physiologist, had been developing their techniques in the field of in vitro (in glass) fertilisation since the mid-1960s.', CAST(N'1978-07-25' AS Date), 7, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (40, N'Space Invaders arrive', N'On this date the first Space Invaders Machine arrived in Britain, ready for the forthcoming Amusements Trade Exhibition in London.', CAST(N'1979-01-22' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (41, N'John Lennon shot', N'Mark Chapman shot John Lennon near the entrance to the Dakota Building in the Upper-West Side of Manhattan, where Lennon lived.', CAST(N'1980-12-08' AS Date), 5, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (43, N'Argentina invades the Falklands', N'Argentina''s General Galtieri invades the Malvinas (as they are known in Spanish), leading Margaret Thatcher to send a task force to recapture them.', CAST(N'1982-04-02' AS Date), 14, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (46, N'Thunderbirds are go!', N'The launch of a new era in puppetry.  Which was your favourite Thunderbird rocket?', CAST(N'1965-09-30' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (47, N'Churchill dies', N'Voted the Greatest Briton of all time, Winnie finally popped his clogs on this date, leading to a massive state funeral.', CAST(N'1965-01-24' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (49, N'Beatles'' first single', N'Love Me Do reached number 17 in the UK, but ushered in the world''s greatest band.  Surely.', CAST(N'1962-10-04' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (50, N'The Pill is launched', N'Leading to the sexual revolution, women can control their own conception for the first time.', CAST(N'1961-12-04' AS Date), 7, 11)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (51, N'First episode of Coronation Street', N'The trumpeter who played the memorable solo on the theme tunetook a one-off fee rather than opting for royalties.  Poor trumpeter, as the Street is still going 65+ years on.', CAST(N'1960-12-09' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (52, N'M1 opens', N'The first full British motorway opens, leading to the introduction of that great British institution, the service station.', CAST(N'1959-11-02' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (54, N'The Lord of the Rings published', N'Fans of Bilbo, Frodo, Gollum or even Sauron (less of the last two, perhaps) have cause to celebrate this date.  Haters of overlong films stuffed with CGI effects less so.', CAST(N'1954-07-21' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (55, N'DNA helix unravelled', N'Francis Crick and James D Watson publish the double helix structure of DNA.  Although James Watson''s autobiography claims all of the credit, the truth is that some of it should also go to Rosalind Franklin of King''s College London', CAST(N'1953-04-25' AS Date), 7, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (58, N'1984 published', N'George Orwell predated "I''m a celebrity, get me out of here!" by 60 years or so - you''ll never look at a rat in the same way again.', CAST(N'1949-06-08' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (60, N'Berlin air-lift begins', N'To get supplies to the American, French and British sectors of Berlin, the allies (excluding Russia, naturally) began flying goods in by air.', CAST(N'1948-06-26' AS Date), 3, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (61, N'The Windrush docks', N'Almost 500 (mainly Jamaicans and Trinidadians) sailed on the SS Empire Windrush, landing in the UK and immediately wondering a) why it was so cold and b) where all the colours had gone.', CAST(N'1948-06-22' AS Date), 7, 20)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (62, N'WWII ends in Europe', N'Although the war in the Far East would go on for another 4 months, this date saw the end of war in Europe, with Germany surrendering unconditionally in Reims.', CAST(N'1945-05-07' AS Date), 2, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (63, N'First edition of Desert Island Discs', N'The greatest radio program ever had its first episode, hosted by its creator Roy Plomley.  The first guest was Vic Oliver, an Austro-American comedian, actor and musician.', CAST(N'1942-01-29' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (64, N'First Times Crossword', N'A great day in history indeed, as the finest cryptic crossword in the world saw the light of day for the first time.', CAST(N'1930-02-01' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (65, N'First pylon', N'Where would the "Pylon of the Month" website be without this date?  And more importantly, where would the National Grid be?', CAST(N'1928-07-14' AS Date), 7, 15)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (66, N'General Strike begins', N'The great General Strike of 1926 began on this day.', CAST(N'1926-05-03' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (67, N'BBC formed', N'The British Broadcasting Company (as it then was called) came into existence, leading to teletubbies and Doctor Who a few decades later.', CAST(N'1922-10-18' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (68, N'Women vote for the first time', N'On this date women voted in a General Election for the first time.', CAST(N'1918-12-14' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (69, N'Russian revolution', N'Actually the second revolution in a year, as Lenin led the Bolsheviks to power (although a long and bitter civil war followed before the communists gained complete control).', CAST(N'1917-11-07' AS Date), 11, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (70, N'The Titanic sinks', N'Would we have ever heard of Leonardo di Caprio and Kate Winslet without this event?', CAST(N'1912-04-15' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (71, N'Captain Oates leaves his tent for the last time', N'Displaying true heroism, Captain Oates goes out for a walk in the polar cold, uttering the famous words that he might be gone for some time.', CAST(N'1912-03-17' AS Date), 15, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (72, N'Theory of relativity published', N'Albert Einstein gives unruly hair a new cool, publishing his theory of relativity.', CAST(N'1905-06-06' AS Date), 3, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (73, N'Queen Victoria dies', N'The then longest-serving monarch Queen Victoria died on this date.', CAST(N'1901-01-22' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (74, N'Labour party formed', N'Leading indirectly to Jeremy Corbyn, the "Labour Representation Committee" first met.', CAST(N'1900-02-27' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (75, N'Daily Mail launched', N'On one of the sadder days in world history, the Daily Mail began.  It set the tone by campaigning against accepting Jewish refugees from Nazi Germany.', CAST(N'1896-05-04' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (76, N'Manchester Ship Canal opens', N'To break the monopoly of Liverpool, Manchester businessmen dug a canal which is still used to this day.', CAST(N'1894-01-01' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (77, N'Preston North End win first league', N'The greatest football team of all time, North End won the first football league.  A pilgrimage to their ground at Deepdale is still a must for the discerning football fan.', CAST(N'1889-01-04' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (78, N'Alice in Wonderland published', N'Lewis Carroll''s masterpiece - humour, wit, puzzles and a bit of a dodgy back story involving an obsession with Alice Liddell.', CAST(N'1865-07-04' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (79, N'US Civil War begins', N'After the secession of South Carolina from the Union, conflict became inevitable.  The first shots of the war were fired on this date.', CAST(N'1861-04-12' AS Date), 5, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (80, N'Charge of the Light Brigade', N'Into the valley of death, rode the 600.  "C’est magnifique, mais ce n’est pas la guerre", said the French field-marshal who watched the charge.', CAST(N'1854-10-25' AS Date), 1, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (81, N'Marx publishes the Communist manifesto', N'One of the most influential events in history, although whether any society has genuinely adopted communism is doubtful.', CAST(N'1848-02-21' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (82, N'Jane Eyre published', N'Chick-lit fiction advanced significantly on this date.  "I married him; I hold myself supremely blest".', CAST(N'1847-10-16' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (83, N'Slavery abolished', N'The disgrace of slavery was officially abolished on this date, after years of campaigning by the likes of William Wilberforce.', CAST(N'1834-08-01' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (84, N'The Battle of Waterloo', N'Immortalised in Abba''s winning Eurovision Song Contest entry, Waterloo saw (just) the defeat of Napoleon by the Duke of Wellington.', CAST(N'1815-06-18' AS Date), 16, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (85, N'Rosetta Stone found', N'Bearing the same inscription in three different languages, the Rosetta Stone was uncovered by Napoleon''s army and allowed us to interpret hieroglyphics.', CAST(N'1799-07-19' AS Date), 17, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (86, N'Storming of the Bastille', N'Thus began the French revolution, leading to the concepts of liberty, equality and fraternity, and much terror besides.', CAST(N'1789-07-14' AS Date), 2, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (87, N'US colonies declare independence', N'Would history have been different if Britain had treated its colonies more fairly?  Perhaps we''d have missed the first man on the moon, the welcoming of refugees from around the world, and Donald Trump.', CAST(N'1776-07-04' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (88, N'The Wealth of Nations published', N'Adam Smith''s seminal work began the "dismal science" of economics, explaining the division of labour by reference to a needle factory.', CAST(N'1776-03-09' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (89, N'The Origin of Species published', N'The most influential theory every published?  Even today a good precept of biology is not to bet against Charles Darwin''s research.', CAST(N'1859-11-24' AS Date), 7, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (90, N'The Y2K bug doesn''t happen', N'Armies of contract programmers make enough money to keep them in coffee and games consoles, but the millennium bug fails to strike.', CAST(N'2000-01-01' AS Date), 7, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (91, N'Berlin Wall falls', N'The collapse of communism in Eastern Europe was complete when East Germans started to tear down the wall that had imprisoned them for decades.', CAST(N'1989-11-09' AS Date), 3, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (92, N'Donald Trump elected', N'The United States shocks the world by electing Donald Trump, a man with (it''s fair to say) illiberal views.', CAST(N'2016-11-08' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (94, N'Ghana becomes independent', N'The state of Ghana, named after the medieval West African empire, becomes an independent country within the Commonwealth of Nations.', CAST(N'1957-03-06' AS Date), 18, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (95, N'The Matrix released', N'One of the greatest films ever made was released on this date.  And yes, the sequels were rubbish.', CAST(N'1999-06-11' AS Date), 5, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (96, N'Wise Owl starts', N'Wise Owl Training began life on this date, being run initially from the basement of a house in Chorlton-cum-Hardy in Manchester.  Those were the days!', CAST(N'1992-02-07' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (97, N'Mao dies', N'Responsible for more deaths than probably anyone else in history, Mao also wrote one of history''s best-sellers - his "Little Red Book".', CAST(N'1976-09-09' AS Date), 19, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (98, N'The Economist launched', N'The bible of absolute truth on earth was launched on this date (or at least, that''s the impression the Economist would give).', CAST(N'1843-08-05' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (99, N'First modern triathlon', N'The first modern swim/bike/run event to be called a triathlon was held at Mission Bay, San Diego, California on this date.', CAST(N'1974-09-25' AS Date), 5, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (100, N'Inventor of glider dies', N'Sir George Cayley, 6th Baronet, was a prolific English engineer who (it is often claimed) invented the glider.', CAST(N'1857-12-15' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (101, N'Karate included in Olympics', N'On this date he International Olympic Committee''s executive board announced from Lausanne that they were supporting the inclusion of karate in the 2020 Games.', CAST(N'2016-06-01' AS Date), 12, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (102, N'Comic-Con conference', N'More than 131,000 visitors make the trip to Excel London for MCM London Comic Con, the UK’s biggest celebration of modern pop culture.', CAST(N'2016-05-27' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (103, N'The world didn''t end', N'On this date in history, the world didn''t end (although the Mayan long calendar did).', CAST(N'2012-12-21' AS Date), 21, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (106, N'UN Charter signed', N'The signing of the UN Charter in San Francisco led to the establishment of the United Nations in New York, ensuring that a little corner of America would be forever international.', CAST(N'1945-06-26' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (107, N'First ever atomic bomb exploded', N'First ever atomic bomb exploded in a test in New Mexico (although there were other forms of atomic device before that, such as the Pile at Stagg Field, first critical on 2nd Dec 1942).', CAST(N'1945-07-16' AS Date), 5, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (108, N'Labour win UK General Election', N'Clement Attlee is elected to power in a labour landslide, booting Churchill out of office and laying the grounds for the NHS and the welfare state.', CAST(N'1945-07-26' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (114, N'UN founded', N'United Nations Organisation comes into existence (the charter is ratified by the five permanent members of the Security Council – Republic of China, France, Soviet Union, United Kingdom, and United States – and by a majority of the other 46 signatories)', CAST(N'1945-10-24' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (116, N'Bermuda Triangle legend starts', N'Loss of ''Flight 19'' on a training exercise begins the legend of the Bermuda Triangle.', CAST(N'1945-12-05' AS Date), 21, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (118, N'First civil flight from Heathrow Airport', N'The first aircraft to take off from Heathrow was a converted Lancaster bomber called Starlight, that flew to Buenos Aires.', CAST(N'1946-01-01' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (119, N'Bank of England nationalised', N'The Bank was privately owned by stockholders from its foundation in 1694 until it was nationalised in 1946.', CAST(N'1946-03-01' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (120, N'Iron Curtain used', N'Churchill uses the term ''Iron Curtain'' in a speech in Missouri.', CAST(N'1946-03-05' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (121, N'US starts nuclear tests', N'US starts nuclear tests at Bikini Atoll – hence the name adopted for the garment which ''reveals the most potent forces of nature''.', CAST(N'1946-07-25' AS Date), 22, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (122, N'Start of Dick Barton on radio', N'Start of Dick Barton, Special Agent on BBC radio – the series ran until March 1951', CAST(N'1946-10-07' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (123, N'First session of UN', N'The first session of the new United Nations Organisation was held in Flushing Meadow, New York.', CAST(N'1946-10-23' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (124, N'Coal Mines nationalised', N'The Labour government of Clement Attlee nationalised the UK''s coal mines, creating the National Coal Board.', CAST(N'1947-01-01' AS Date), 7, 15)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (125, N'International Organization for Standardization founded', N'Paving the way for a million meetings and reports to discuss standards, the ISO came into being on this date in London.', CAST(N'1947-02-23' AS Date), 7, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (126, N'IMF founded', N'The International Monetary Fund was created in Bretton Woods in the United States.', CAST(N'1945-12-27' AS Date), 5, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (127, N'School leaving age raised to 15', N'School leaving age raised to 15 in Britain', CAST(N'1947-04-01' AS Date), 7, 19)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (128, N'India gains independence', N'India gains independence: the sub-continent partitioned to form India (secular, but with a Hindu majority) and Pakistan (Islamic).', CAST(N'1947-08-14' AS Date), 21, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (129, N'Sound barrier broken', N'Chuck Yeager becomes the first person to break the sound barrier', CAST(N'1947-10-14' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (130, N'British military occupation ends in Iraq', N'History repeats itself, as Britain pulls out of Iraq.', CAST(N'1947-10-26' AS Date), 23, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (131, N'Marriage of Princess Elizabeth', N'Princess Elizabeth (later Elizabeth II) marries Philip Mountbatten in Westminster Abbey.', CAST(N'1947-11-20' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (132, N'British Railways nationalised', N'The Labour government nationalises the rail industry.', CAST(N'1948-01-01' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (133, N'Gandhi assassinated in Delhi', N'Mahatma Gandhi died from his assassin Nathuram Vinayak Godse''s bullets during an evening prayer ceremony at Birla House in Delhi. Perched atop a gate of Birla House, Prime Minister Jawaharlal Nehru announced to the world that the “light has gone out of our lives”.', CAST(N'1948-01-30' AS Date), 24, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (134, N'Marshall Plan signed', N'The Marshall Plan is signed by President Truman for rebuilding the allied countries of Europe (aid had started in 1947 and ended in 1951).', CAST(N'1948-04-03' AS Date), 21, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (136, N'NHS founded', N'The National Health Service (NHS) begins in Britain.  Who would have thought it would have a starring role in the London Olympics over 60 years later?', CAST(N'1948-07-05' AS Date), 20, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (138, N'Clothes rationing ends', N'Clothes rationing ends in Britain, as wartime austerity gradually eases.', CAST(N'1949-03-15' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (139, N'NATO founded', N'Twelve nations sign The North Atlantic Treaty, creating NATO', CAST(N'1949-04-04' AS Date), 21, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (140, N'The Berlin blockade ends', N'Russia lifts the Berlin blockade, allowing the overland transport of goods to the allied parts of Berlin to resume.', CAST(N'1949-05-12' AS Date), 3, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (144, N'Korean War starts', N'North Korea (helped by Mao Tse Tung''s China) invaded South Korea, leading to a war which officially ended on 27 Jul 1953, but still rumbles on today.', CAST(N'1950-06-25' AS Date), 25, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (145, N'Andy Pandy first seen on TV', N'Andy Pandy first appears on BBC TV.  "Andy Pandy''s come to play, la la-la la-la la".', CAST(N'1950-07-11' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (147, N'Peak District is the first National Park', N'The Peak District becomes the Britain''s first National Park, leading to traffic jams through Glossop which may some day be removed by the building of the Longdendale Bypass …', CAST(N'1950-12-28' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (148, N'Festival of Britain', N'Festival of Britain and the Royal Festival Hall open on South Bank, London', CAST(N'1951-05-03' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (150, N'Electricity first produced by nuclear power', N'Electricity first produced by nuclear power, from the Experimental Breeder Reactor I in Idaho', CAST(N'1951-12-20' AS Date), 5, 15)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (151, N'George VI dies; Elizabeth II queen', N'Elizabeth II learns while on holiday in Kenya that she is to be queen (although she probably couldn''t imagine that she would go on to become Britain''s longest-serving monarch)', CAST(N'1952-02-06' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (154, N'First commercial jet', N'The first commercial jet airliner service launched, by BOAC Comet between London and Johannesburg', CAST(N'1952-05-02' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (155, N'Last tram runs in London', N'Last tram runs in London (from Woolwich to New Cross) - at least until Croydon re-introduces trams in the 21st century', CAST(N'1952-07-05' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (156, N'Lynmouth flood disaster', N'More than 100 buildings were destroyed or seriously damaged along with 28 bridges, and 38 cars were washed out to sea. In total, 34 people died, with a further 420 made homeless.', CAST(N'1952-08-16' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (157, N'DH110 crashes at Farnborough', N'A DH110 crashes at the Farnborough Air Show, killing 26 people', CAST(N'1952-09-06' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (158, N'John Cobb killed', N'John Cobb killed in an attempt on the world water speed record on Loch Ness', CAST(N'1952-09-29' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (160, N'Harrow & Wealdstone rail crash', N'112 people are killed in the Harrow & Wealdstone rail crash', CAST(N'1952-10-08' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (161, N'First H Bomb exploded', N'The first H-bomb ever (''Mike'') was exploded by the USA – the mushroom cloud was 8 miles across and 27 miles high. The canopy was 100 miles wide. Radioactive mud fell out of the sky followed by heavy rain. 80 million tons of earth was vaporised.', CAST(N'1952-11-01' AS Date), 5, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (162, N'Eisenhower is US President', N'Eisenhower sweeps to power as US President', CAST(N'1952-11-05' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (163, N'First UK singles chart', N'The first regular UK singles chart is published by the New Musical Express', CAST(N'1952-11-14' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (164, N'The Mousetrap opens', N'Agatha Christie''s The Mousetrap opens in London - where it is still running today', CAST(N'1952-11-25' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (165, N'Great smog hits London', N'The great smog renders most of London invisible, leading to the passing of the Clean Air Act', CAST(N'1952-12-04' AS Date), 7, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (166, N'Floods devastate the East Coast', N'Said to be the biggest civil catastrophe in Britain in the 20th century: severe storm and high tides caused the loss of hundreds of lives.  The effects travelled from the west coast of Scotland round to the south-east coast of England.', CAST(N'1953-01-31' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (168, N'Death of Stalin', N'Iosif Vissarionovich Dzhugashvili, better known as Stalin, died - almost certainly of natural causes - at his Kuntsevo residence 15 km west of Moscow centre.', CAST(N'1953-03-05' AS Date), 11, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (169, N'Polio vaccine announced', N'Dr. Francis announces the development of a polio vaccine to a crowd of scientists and reporters at the University of Michigan''s Rackham Auditorium, concluding his two-year national field trials of the poliomyelitis vaccine developed by his former student, Jonas Salk.', CAST(N'1953-03-26' AS Date), 5, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (170, N'Winston Churchill knighted', N'"Winnie" becomes Sir Winston Churchill', CAST(N'1953-04-24' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (172, N'Everest conquered', N'Edmund Hillary and Tenzing Norgay climb Mount Everest for the first time.', CAST(N'1953-05-29' AS Date), 26, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (173, N'Coronation of Elizabeth II', N'Elizabeth II is crowned queen of England, a post she was to hold for a fair few years.', CAST(N'1953-06-02' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (174, N'End of the Korean War', N'The 1950-53 Korean War ended in an armistice, with neither side able to claim outright victory. Decades on, the truce is still all that technically prevents North Korea and the US - along with its ally South Korea - resuming the war, as no peace treaty has ever been signed.', CAST(N'1953-07-27' AS Date), 25, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (177, N'Piltdown Man skull declared a hoax', N'The Piltdown Man skull is declared a hoax by the Natural History Museum.  The identity of the Piltdown forger remains unknown.', CAST(N'1953-11-21' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (178, N'Hungary win 6-3 at Wembley Stadium', N'Hungary becomes the first football team outside the British Isles to beat England at home, winning 6-3 at Wembley Stadium.', CAST(N'1953-11-25' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (179, N'First sub 4 minute mile', N'Roger Bannister becomes the first man to run a mile in under 4 minutes (3 minutes 59.4 secs, to be exact)', CAST(N'1954-05-06' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (180, N'Rock Around the Clock released', N'Bill Haley and the Comets release Rock Around the Clock', CAST(N'1954-05-10' AS Date), 5, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (182, N'First BBC news', N'The BBC broadcasts its first television news bulletin', CAST(N'1954-07-05' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (183, N'First atomic powered sumbmarine', N'The USS Nautilus is commissioned - the world''s first nuclear powered submarine', CAST(N'1954-09-30' AS Date), 5, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (184, N'Anthony Eden becomes Prime Minister', N'Anthony Eden becomes Prime Minister, having succeeded Winston Churchill as leader of the Conservatives', CAST(N'1955-04-07' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (186, N'Allied occupation of Austria ends', N'The allied occupation of Austria (after World War 2) ends', CAST(N'1955-07-27' AS Date), 27, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (187, N'Commercial TV starts in Britain', N'Commercial TV starts in Britain (the first advert was for Gibbs SR toothpaste).  BBC Radio kills off Grace Archer in retaliation.', CAST(N'1955-09-22' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (188, N'Radiotelephony spelling alphabet introduced', N'Originally developed by the International Civil Aviation Organization, the radiotelephony spelling alphabet was introduced (Alpha, Bravo, Charlie, Delta, Echo ...).', CAST(N'1956-03-01' AS Date), 21, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (189, N'Premium Bonds introduced', N'Premium Bonds launched – the first prizes were drawn on 1 Jun 1957', CAST(N'1956-04-17' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (190, N'Eurovision Song Contest launched', N'The first Eurovision Song Contest is held in Lugano, Switzerland – won by the host nation.', CAST(N'1956-05-24' AS Date), 12, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (191, N'3rd class travel abolished on BR', N'3rd class travel abolished on British Railways (who renamed ''Third Class'' as ''Second Class'', which had been abolished in 1875 leaving just First and Third Class)', CAST(N'1956-06-03' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (193, N'Hungarian uprising', N'Hungarians protest against the Soviet occupation (the protest was crushed on 4th November)', CAST(N'1956-10-23' AS Date), 28, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (194, N'Britain and France invade Suez', N'Israel invades Egypt to regain western control of the Suez Canal, followed by Britain and France.  Political pressure from the United States, the Soviet Union, and the United Nations led to a withdrawal by the three invaders.', CAST(N'1956-10-31' AS Date), 17, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (196, N'Harold Macmillan becomes Prime Minister', N'Harold Macmillan, the first Earl of Stockton, becomes Conservative Prime Minister', CAST(N'1957-01-11' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (197, N'BBC TV broadcasts Six-Five Special', N'BBC TV started to broadcast Six-Five Special, breaking the ''Toddlers'' Truce'' of no broadcasting between 6 and 7pm', CAST(N'1957-02-16' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (198, N'Suez canal reopened', N'Egypt reopens the Suez Canal', CAST(N'1957-03-08' AS Date), 17, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (199, N'EEC founded', N'The Treaty of Rome creates a European Economic Community (EEC) of six countries: France, West Germany, Italy, Belgium, Holland and Luxembourg, becoming operational in January 1958', CAST(N'1957-03-25' AS Date), 21, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (201, N'Britain explodes first H bomb', N'Britain explodes her first hydrogen bomb, at Christmas Island', CAST(N'1957-05-15' AS Date), 21, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (203, N'West Side Story opens', N'West Side Story opens in New York', CAST(N'1957-09-26' AS Date), 5, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (204, N'Sputnik I launched by Soviet Union', N'Sputnik I launched by Soviet Union - the world''s first artificial satellite', CAST(N'1957-10-04' AS Date), 13, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (205, N'Sputnik 2 launched by Soviet Union', N'Sputnik 2 launched by Soviet Union, carrying a dog (''Laika'') into sapce', CAST(N'1957-11-03' AS Date), 13, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (206, N'Lewisham rail disaster', N'90 people are killed as two trains collide in thick fog and a viaduct collapses on top of them.', CAST(N'1957-12-04' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (208, N'Munich air disaster', N'23 people including many Manchester United team members were killed when flight 609 crashed on its third attempt to take off from a slush-covered runway at Munich-Riem Airport, West Germany.', CAST(N'1958-02-06' AS Date), 3, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (209, N'CND launched', N'The Campaign for Nuclear Disarmament was launched', CAST(N'1958-02-25' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (211, N'Velcro trade mark registered', N'Swiss electrical engineer George de Mestral invented his first touch fastener when, in 1941, he went for a walk in the woods and wondered if the burrs that clung to his trousers — and dog — could be turned into something useful.', CAST(N'1958-05-13' AS Date), 21, 17)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (212, N'Charles created Prince of Wales', N'Queen Elizabeth''s eldest child, Charles, is created Prince of Wales', CAST(N'1958-07-26' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (213, N'USS Nautilus travels under the polar ice cap', N'The USS Nautilus becomes the first submarine to complete a submerged transit of the North Pole', CAST(N'1958-08-03' AS Date), 21, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (214, N'Charles de Gaulle establishes Fifth Republic', N'Charles de Gaulle establishes the Fifth Republic in France – and is elected President on 21 December', CAST(N'1958-10-05' AS Date), 2, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (215, N'First commercial flight of Boeing 707', N'First commercial flight of Boeing 707 (from New York to Paris)', CAST(N'1958-10-26' AS Date), 5, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (216, N'Inauguration of STD calls', N'Inauguration of Subscriber Trunk Dialling (STD) in Britain (completed in 1979)', CAST(N'1958-12-05' AS Date), 7, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (217, N'Preston by-pass opens', N'Preston by-pass opens – the UK''s first stretch of motorway', CAST(N'1958-12-05' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (218, N'Buddy Holly dies', N'''The Day The Music Died'' – a plane crash kills Buddy Holly, Ritchie Valens, and The Big Bopper near Clear Lake, Iowa', CAST(N'1959-02-03' AS Date), 5, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (220, N'St Lawrence Seaway opens', N' The system of locks, canals and channels in Canada and the United States permitting ocean-going vessels to travel from the Atlantic Ocean to the Great Lakes of North America opens', CAST(N'1959-04-25' AS Date), 21, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (222, N'Hawaii becomes 50th State', N'Hawaii becomes 50th State of the USA, rendering Barack Obama''s future birthplace indubitably American', CAST(N'1959-08-21' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (224, N'Postcodes introduced', N'Postcodes introduced in Britain', CAST(N'1959-10-03' AS Date), 7, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (226, N'Macmillan ''wind of change'' speech', N'Harold Macmillan makes his famous ''wind of change'' speech in South Africa', CAST(N'1960-02-03' AS Date), 29, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (227, N'New £1 notes issued', N'New £1 notes are issued by the Bank of England', CAST(N'1960-03-17' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (228, N'Last steam locomotive named', N'The last steam locomotive of British Railways named', CAST(N'1960-03-18' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (229, N'Francis Chichester arrives in New York', N'Francis Chichester arrives in New York aboard Gypsy Moth II (took 40 days), winning the first single-handed transatlantic yacht race which he co-founded', CAST(N'1960-07-21' AS Date), 5, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (231, N'MoT tests introduced', N'MoT tests on motor vehicles introduced', CAST(N'1960-09-12' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (232, N'Nikita Khrushchev disrupts the UN', N'Nikita Khrushchev disrupts the United Nations General Assembly with a number of angry outbursts', CAST(N'1960-09-29' AS Date), 21, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (234, N'Lady Chatterley''s Lover case', N'Penguin Books found not guilty of obscenity in the Lady Chatterley''s Lover case', CAST(N'1960-11-02' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (235, N'Farthing ceases to be legal tender', N'The farthing (representing one quarter of an old penny) ceases to be legal tender in the UK', CAST(N'1961-01-01' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (236, N'JFK becomes US President', N'"Ask not what your country can do for you …" - John F Kennedy becomes the 35th President of the United States', CAST(N'1961-01-20' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (237, N'First US Polaris submarines', N'The first US Polaris submarines arrive at Holy Loch', CAST(N'1961-03-08' AS Date), 5, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (240, N'Yuri Gagarin first man in space', N'Yuri Gagarin becomes the first man in space – followed shortly afterwards by Alan Shepard on 5th May', CAST(N'1961-04-12' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (241, N'Census results', N'Census returns gives the population of England and Wales at 46 million, Scotland and 5.1 millions and Northern Ireland at 1.4 millionM', CAST(N'1961-04-23' AS Date), 7, 20)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (242, N'Betting shops legal', N'Betting shops become legal in Britain', CAST(N'1961-05-01' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (243, N'JFK announces space goal', N'John F Kennedy announces his goal to put a "man on the moon" before the end of the decade', CAST(N'1961-05-25' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (244, N'Volcanic eruption on Tristan da Cunha', N'Volcanic eruption on Tristan da Cunha – the whole population is evacuated to Britain', CAST(N'1961-10-10' AS Date), 21, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (245, N'Consecration of new Coventry Cathedral', N'Consecration of new Coventry Cathedral (the old one was destroyed in the WW2 blitz) accompanied by the Britten War Requiem', CAST(N'1962-05-25' AS Date), 7, 18)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (246, N'First nuclear generated electricity', N'First nuclear generated electricity is supplied to the National Grid (from Berkeley, Glos)', CAST(N'1962-06-15' AS Date), 7, 15)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (247, N'Telstar launched', N'First TV transmission between US and Europe (Telstar) – first live broadcast on 23 July', CAST(N'1962-07-10' AS Date), 21, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (248, N'Marilyn Monroe found dead', N'Marilyn Monroe (aka Norma Jean Baker) is found dead in her bedroom', CAST(N'1962-08-05' AS Date), 5, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (249, N'Cuba missile crisis', N'The Cuba missile crisis takes the world to the brink of nuclear war', CAST(N'1962-10-24' AS Date), 30, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (251, N'Beeching Report', N'The Beeching Report on British Railways (the ''Beeching Axe'') recommends the closure of many lines', CAST(N'1963-03-27' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (252, N'John Profumo resigns', N'Secretary of State for War John Profumo resigns in a sex scandal', CAST(N'1963-06-05' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (253, N'The "red telephone" link established', N'The "red telephone" link is established between Soviet Union and United States following the Cuban Missile Crisis', CAST(N'1963-06-20' AS Date), 21, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (255, N'Great Train Robbery', N'''Great Train Robbery'' on Glasgow to London mail train', CAST(N'1963-08-08' AS Date), 7, 17)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (256, N'Martin Luther King speech', N'Somehow Donald Trump''s "Lock her up" doesn''t have quite the same gravitas as this call for equal rights in the United States.', CAST(N'1963-08-28' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (257, N'Fylingdales operational', N'Fylingdales (Yorks) early warning system operational', CAST(N'1963-09-17' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (260, N'President Kennedy assassinated', N'Providing endless ammunition for conspiracy theorists, JFK was shot by Lee Harvey Oswald in Dallas, Texas.  Or was he?', CAST(N'1963-11-22' AS Date), 5, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (261, N'First episode of Dr Who', N'The first episode of Dr Who is broadcast on BBC TV', CAST(N'1963-11-23' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (262, N'First ''Top of the Pops''', N'First ''Top of the Pops'' on BBC TV', CAST(N'1964-01-01' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (263, N'The Beatles arrive in the US', N'The Beatles arrive on their first visit to the United States', CAST(N'1964-02-07' AS Date), 5, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (264, N'Cassius Clay beats Sonny Liston', N'Cassius Clay (Muhammad Ali) beats Sonny Liston in Miami Beach', CAST(N'1964-02-25' AS Date), 5, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (265, N'First GLC election', N'First Greater London Council (GLC) election', CAST(N'1964-04-09' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (266, N'BBC2 TV starts', N'BBC2 TV starts -  Play School is the first programme to be shown officially on the channel.', CAST(N'1964-04-21' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (267, N'Match of the Day starts', N'Match of the Day starts on BBC2', CAST(N'1964-08-22' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (268, N'Forth road bridge opens', N'The Forth road bridge opens - presumably with fresh paint', CAST(N'1964-09-04' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (269, N'The Sun newspaper founded', N'The Sun newspaper is founded in Britain, replacing the Daily Herald', CAST(N'1964-09-15' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (270, N'First US raids against North Vietnam', N'The first US raids are made against North Vietnam, beginning the Vietnam War', CAST(N'1965-02-07' AS Date), 10, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (271, N'First walk in space', N'Cosmonaut Aleksei Leonov becomes the first man to ''walk'' in space', CAST(N'1965-03-18' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (277, N'North Sea oil found', N'Oil / natural gas is struck by BP in the North Sea', CAST(N'1965-09-21' AS Date), 7, 15)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (278, N'Post Office Tower opens', N'The iconic Post Office Tower becomess operational in London', CAST(N'1965-10-08' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (279, N'Death penalty for murder suspended', N'Death penalty for murder suspended in Britain for a five-year trial period, and then abolished 18 Dec 1969', CAST(N'1965-10-28' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (280, N'UDI in Rhodesia', N'Ian Smith''s Unilateral Declaration of Indepence in Rhodesia (now Zimbabwe)', CAST(N'1965-11-11' AS Date), 31, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (281, N'70mph speed limit introduced', N'A 70mph speed limit comes into force on British roads', CAST(N'1965-12-22' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (283, N'Australia converts from £ to $', N'The Australian dollar is introduced, replacing the pound', CAST(N'1966-02-14' AS Date), 32, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (285, N'The Times prints news on front page', N'The Times begins to print news on its front page in place of classified advertisements', CAST(N'1966-05-03' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (287, N'World Cup won by England at Wembley', N'World Cup won by England at Wembley (4-2 in extra time v West Germany). They think it''s all over … and it was, as England haven''t won the World Cup since.', CAST(N'1966-07-30' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (288, N'First Severn road bridge opens', N'The first Severn road bridge opens', CAST(N'1966-09-08' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (289, N'Aberfan disaster', N'Aberfan disaster – a slag heap slip kills 144, including 116 children', CAST(N'1966-10-21' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (291, N'Donald Campbell dies', N'Donald Campbell dies attempting to break his world water speed record on Conniston Water – his body and Bluebird recovered in 2002', CAST(N'1967-01-04' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (292, N'Apollo launch pad test fire', N'Three US astronauts are killed in a fire during Apollo launch pad test', CAST(N'1967-01-27' AS Date), 5, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (293, N'Torrey Canyon oil tanker disaster', N'Torrey Canyon oil tanker runs aground off Lands End – first major oil spill', CAST(N'1967-03-18' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (294, N'Celtic win the European Cup', N'Celtic become the first British team to win the European Cup', CAST(N'1967-05-25' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (295, N'Francis Chichester arrives in Plymouth', N'Francis Chichester arrives in Plymouth after solo circumnavigation in Gipsy Moth IV (he was knighted 7th July at Greenwich by the queen using the sword with which Elizabeth I had knighted Sir Francis Drake four centuries earlier)', CAST(N'1967-05-28' AS Date), 7, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (296, N'First withdrawal from a cash dispenser (ATM)', N'First withdrawal from a cash dispenser (ATM) in Britain – at the Enfield branch of Barclays', CAST(N'1967-06-27' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (297, N'First colour TV', N'First colour television in Britain', CAST(N'1967-07-01' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (298, N'Public Record Act', N'Public Record Act – records now closed for only 30 years (but the census is still closed for 100 years)', CAST(N'1967-07-13' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (301, N'Sweden drives on the right', N'Sweden changes the rules of the road overnight to drive on right', CAST(N'1967-09-03' AS Date), 33, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (302, N'QE2 launched', N'The QE2 is launched on Clydebank', CAST(N'1967-09-20' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (303, N'Queen Mary last transatlantic voyage', N'Queen Mary arrives Southampton at end of her last transatlantic voyage', CAST(N'1967-09-27' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (304, N'BBC Radios 1, 2, 3 & 4 open', N'BBC Radios 1, 2, 3 & 4 open – first record played on Radio 1 was the controversial Flowers in the Rain by ''The Move''', CAST(N'1967-09-30' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (305, N'Introduction of majority verdicts', N'Introduction of majority verdicts in English courts', CAST(N'1967-10-05' AS Date), 7, 17)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (306, N'Che Guevara killed in Bolivia', N'Che Guevara killed in Bolivia – and becomes a cult hero', CAST(N'1967-10-09' AS Date), 34, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (307, N'Russian spacecraft Venus IV', N'Russian spacecraft Venus IV became first successful probe to perform in-place analysis of the environment of another planet', CAST(N'1967-10-18' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (308, N'First human heart transplant', N'First human heart transplant (in South Africa by Christiaan Barnard)', CAST(N'1967-12-03' AS Date), 29, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (309, N'British Standard Time introduced', N'British Standard Time introduced – Summer Time becomes permanent - the UK reverts to GMT in October 1971', CAST(N'1968-02-18' AS Date), 7, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (310, N'London Bridge sold', N'London Bridge sold (and eventually moved to Arizona) – the modern London Bridge, built around it as it was demolished, was opened in Mar 1973', CAST(N'1968-04-18' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (311, N'Enoch Powell ''Rivers of Blood'' speech', N'Enoch Powell''s famous ''Rivers of Blood'' speech on immigration', CAST(N'1968-04-20' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (313, N'Student riots in Paris', N'Student riots in Paris', CAST(N'1968-05-10' AS Date), 2, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (314, N'Manchester United win the European Cup', N'Manchester United first English club to win the European Cup', CAST(N'1968-05-29' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (315, N'Robert F Kennedy shot', N'Robert F Kennedy shot – dies next day', CAST(N'1968-06-05' AS Date), 5, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (316, N'Pope condemns birth control', N'Papal encyclical condemns all artificial forms of birth control', CAST(N'1968-07-29' AS Date), 21, 11)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (317, N'Last steam passenger train service', N'Last steam passenger train service runs in Britain (Carlisle–Liverpool)', CAST(N'1968-08-11' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (321, N'Beginning of troubles', N'The beginning of disturbances in N Ireland', CAST(N'1968-10-05' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (322, N'The Beatles'' last public performance', N'The Beatles'' last public performance, on the roof of Apple Records in London', CAST(N'1969-01-30' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (323, N'Maiden flight of Concorde', N'Maiden flight of Concorde, at Toulouse', CAST(N'1969-03-02' AS Date), 2, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (324, N'Victoria Line tube opens', N'The Victoria Line tube opens in London', CAST(N'1969-03-07' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (325, N'Voting age lowered to 18', N'The voting age is lowered from 21 to 18', CAST(N'1969-04-17' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (326, N'Maiden voyage of QE2', N'The maiden voyage of the liner Queen Elizabeth 2 (QE2)', CAST(N'1969-05-02' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (327, N'Investiture of Prince Charles', N'Investiture of Prince Charles as Prince of Wales at Caernarfon Castle', CAST(N'1969-07-01' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (328, N'First men land on the moon', N'Apollo 11 – First men land on the moon (Neil Armstrong & Buzz Aldrin)', CAST(N'1969-07-20' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (330, N'Civil disturbances in Ulster', N'Civil disturbances in Ulster – Britain sends troops to support civil authorities', CAST(N'1969-08-14' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (331, N'Woodstock Music Festival', N'Woodstock Music Festival in NY State attracts 300,000 fans', CAST(N'1969-08-15' AS Date), 5, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (334, N'Apollo 12 – second manned landing on the moon', N'Apollo 12 – second manned landing on the moon (Charles Conrad & Alan Bean)', CAST(N'1969-11-19' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (335, N'Death penalty for murder abolished in Britain', N'Death penalty for murder abolished in Britain (had already been suspended since Oct 1965)', CAST(N'1969-12-18' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (337, N'Apollo 13 launched', N'Apollo 13 launched – oxygen tank explosion aborted the moon landing mission two days later – successfully returned to Earth on 17 Apr', CAST(N'1970-04-11' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (339, N'Edward Heath becomes Prime Minister', N'Edward Heath becomes Prime Minister', CAST(N'1970-06-19' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (340, N'Damages awarded to Thalidomide victims', N'Damages awarded to Thalidomide victims', CAST(N'1970-07-30' AS Date), 7, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (341, N'First Glastonbury Festival held', N'First Glastonbury Festival held', CAST(N'1970-09-19' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (342, N'Ten shilling note goes out of circulation', N'Ten shilling note (50p after decimalisation) goes out of circulation in Britain', CAST(N'1970-11-20' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (344, N'Open University starts', N'Open University starts', CAST(N'1971-01-03' AS Date), 7, 19)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (346, N'Internment without trial', N'Internment without trial introduced in N Ireland', CAST(N'1971-08-09' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (348, N'Parliament votes to join Common Market', N'Parliament votes to join Common Market (joined 1973)', CAST(N'1971-10-28' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (349, N'Mariner 9 orbits Mars', N'Mariner 9, becomes the first spacecraft to orbit another planet (Mars)', CAST(N'1971-11-13' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (352, N'Ceylon changes its name to Sri Lanka', N'Ceylon changes its name to Sri Lanka', CAST(N'1972-05-22' AS Date), 35, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (356, N'Last manned moon mission, Apollo 17, launched', N'Last manned moon mission, Apollo 17, launched – crew take the ''Blue marble'' photograph of earth', CAST(N'1972-12-07' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (358, N'Vietnam ceasefire agreement signed', N'Vietnam ceasefire agreement signed', CAST(N'1973-01-27' AS Date), 10, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (359, N'London Bridge opened', N'Modern London Bridge opened by the Queen', CAST(N'1973-03-17' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (360, N'VAT introduced', N'VAT introduced in Britain', CAST(N'1973-04-01' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (361, N'First call made on mobile', N'First call made (in New York) on a portable cellular phone', CAST(N'1973-04-03' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (363, N'Concorde crosses Atlantic', N'Concorde makes its first non-stop crossing of the Atlantic in record-breaking time', CAST(N'1973-09-26' AS Date), 21, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (364, N'Yom Kippur War', N'Yom Kippur War precipitates world oil crisis', CAST(N'1973-10-06' AS Date), 21, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (365, N'Marriage of Princess Anne', N'Marriage of Princess Anne and Captain Mark Phillips in Westminster Abbey', CAST(N'1973-10-14' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (366, N'Sydney Opera House opens', N'Sydney Opera House opens', CAST(N'1973-10-22' AS Date), 32, 20)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (367, N'Miners strike and three-day week', N'Miners strike and oil crisis precipitate ''three-day week'' (till 9 Mar 1974) to conserve power', CAST(N'1973-12-31' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (368, N'Watergate scandal', N'President Nixon resigns over Watergate scandal', CAST(N'1974-08-08' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (369, N'Lord Lucan disappears', N'Lord Lucan disappears', CAST(N'1974-11-07' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (370, N'Birmingham pub bombings', N'Birmingham pub bombings by the IRA', CAST(N'1974-11-21' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (371, N'Margaret Thatcher becomes Tory leader', N'Margaret Thatcher becomes leader of Conservative party (in opposition)', CAST(N'1975-02-11' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (372, N'Moorgate tube crash in London', N'Moorgate tube crash in London – over 43 deaths, greatest loss of life on the Underground in peacetime. The cause of the incident was never conclusively determined', CAST(N'1975-02-28' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (373, N'Charlie Chaplin knighted', N'Charlie Chaplin knighted', CAST(N'1975-03-04' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (375, N'UK votes to stay in EEC', N'UK votes in a referendum to stay in the European Community.  This time, anyway.', CAST(N'1975-06-05' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (376, N'Suez canal reopens', N'Suez canal reopens (after 8 years closure)', CAST(N'1975-06-05' AS Date), 17, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (377, N'Arthur Ashe wins Wimbledon', N'Arthur Ashe wins Wimbledon singles title', CAST(N'1975-07-05' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (378, N'American Apollo and Soviet Soyuz spacecraft dock in orbit', N'American Apollo and Soviet Soyuz spacecraft dock in orbit', CAST(N'1975-07-17' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (379, N'''Yorkshire Ripper'' commits his first murder', N'''Yorkshire Ripper'' commits his first murder', CAST(N'1975-10-29' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (380, N'First North Sea oil comes ashore', N'First North Sea oil comes ashore', CAST(N'1975-11-03' AS Date), 7, 15)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (381, N'General Franco dies in Spain', N'General Franco dies in Spain; Juan Carlos declared King', CAST(N'1975-11-20' AS Date), 36, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (383, N'Equal Pay Act and Sex Discrimination Act', N'Equal Pay Act and Sex Discrimination Act come into force', CAST(N'1975-12-27' AS Date), 7, 17)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (384, N'Concorde enters service', N'Concorde enters supersonic passenger service', CAST(N'1976-01-21' AS Date), 21, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (385, N'Apple Computer formed', N'Apple Computer formed by Steve Jobs and Steve Wozniak', CAST(N'1976-04-01' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (386, N'Drought Act 1976 comes into force', N'Drought Act 1976 comes into force — the long, hot summer', CAST(N'1976-08-06' AS Date), 7, 4)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (387, N'Lib-Lab pact', N'The short-lived pact between the Liberal and Labour parties is made', CAST(N'1977-03-23' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (388, N'Red Rum wins a third Grand National', N'Red Rum wins a third Grand National', CAST(N'1977-04-02' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (389, N'Star Wars released', N'George Lucas'' film Star Wars released', CAST(N'1977-05-25' AS Date), 5, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (390, N'New road speed limits', N'Road speed limits: 70mph dual roads; 60mph single', CAST(N'1977-06-01' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (391, N'Apple II goes on sale', N'Apple II, the first practical personal computer, goes on sale', CAST(N'1977-06-05' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (392, N'Queen''s Silver Jubilee celebrations', N'Queen''s Silver Jubilee celebrations in London', CAST(N'1977-06-07' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (393, N'Virginia Wade wins Wimbledon', N'Virginia Wade wins the Ladies Singles title at Wimbledon', CAST(N'1977-06-30' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (394, N'Elvis Presley dies', N'Elvis Presley, the King of Rock and Roll, dies - spawning a myriad impersonators', CAST(N'1977-08-16' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (395, N'Eradication of smallpox declared', N'Eradication of smallpox world-wide declared by WHO (certified in 1979)', CAST(N'1977-10-26' AS Date), 21, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (397, N'Broadcast of proceedings in Parliament starts', N'Regular broadcast of proceedings in Parliament starts', CAST(N'1978-04-08' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (400, N'Pope John Paul II elected', N'Pope John Paul II elected – a Pole, and first non-Italian for 450 years – died 2 Apr 2005', CAST(N'1978-10-15' AS Date), 43, 18)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (401, N'Publication of The Times suspended', N'Publication of The Times suspended – industrial relations problems (until 13 Nov 1979)', CAST(N'1978-11-30' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (402, N'Ayatollah Khomeini returns to Iran', N'Ayatollah Khomeini returns to Iran', CAST(N'1979-02-01' AS Date), 37, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (403, N'Devolution votes', N'32.5% of Scots vote in favour of devolution (40% needed) – Welsh vote overwhelmingly against', CAST(N'1979-03-01' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (404, N'Airey Neave killed', N'Airey Neave killed by a car bomb at Westminster', CAST(N'1979-03-30' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (406, N'Margaret Thatcher becomes Prime Minister', N'Margaret Thatcher becomes first woman UK Prime Minister', CAST(N'1979-05-04' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (407, N'Sony introduces the Walkman', N'Sony introduces the Walkman personal stereo', CAST(N'1979-07-01' AS Date), 21, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (408, N'Lord Mountbatten killed', N'Lord Mountbatten and 3 others killed in bomb blast off coast of Sligo, Ireland', CAST(N'1979-08-27' AS Date), 38, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (409, N'ILEA votes to abolish corporal punishment', N'ILEA votes to abolish corporal punishment in its schools', CAST(N'1979-09-18' AS Date), 7, 19)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (411, N'Lancaster House agreement', N'Lancaster House agreement to give Southern Rhodesia independence (became Zimbabwe on 18 Apr 1980)', CAST(N'1979-12-21' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (412, N'Death of President Tito of Yugoslavia', N'Death of President Tito of Yugoslavia', CAST(N'1980-05-04' AS Date), 21, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (413, N'SAS storm Iranian Embassy', N'SAS storm Iranian Embassy in London to free hostages', CAST(N'1980-05-05' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (415, N'Launch of SDP by ''Gang of Four'' in Britain', N'Launch of the Social Democrat Party by ''Gang of Four'' in Britain', CAST(N'1981-01-25' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (416, N'First London marathon', N'First London marathon run', CAST(N'1981-03-29' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (418, N'Brixton riots in South London', N'Brixton riots in South London – 30 other British cities also experience riots', CAST(N'1981-04-11' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (419, N'First US Space Shuttle (Columbia) launched', N'First US Space Shuttle (Columbia) launched', CAST(N'1981-04-12' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (421, N'First use of computer mouse', N'First use of computer mouse (by Xerox PARC system)', CAST(N'1981-04-27' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (422, N'Wedding of Prince Charles', N'The UK indulges in an orgy of romance, as the  ‘fairy-tale wedding’ takes place at St Paul’s Cathedral between Prince Charles and Lady Diana Spencer (divorced 28 Aug 1996)', CAST(N'1981-07-29' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (423, N'IBM launches its PC', N'IBM launches its PC — and starts the general use of personal computers', CAST(N'1981-08-12' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (424, N'Unemployment reaches 3 million', N'Unemployment reaches 3 million in Britain (1 in 8 of working population)', CAST(N'1982-01-26' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (425, N'Laker Airways collapses', N'Laker Airways collapses', CAST(N'1982-02-05' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (426, N'DeLorean collapses', N'DeLorean Car factory in Belfast goes into receivership', CAST(N'1982-02-19' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (429, N'Royal Navy fleet sails from Portsmouth', N'Royal Navy fleet sails from Portsmouth for Falklands', CAST(N'1982-04-05' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (430, N'General Belgrano sunk', N'British nuclear submarine HMS Conqueror sinks Argentine cruiser General Belgrano', CAST(N'1982-05-02' AS Date), 21, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (431, N'Goose Green battle', N'First land battle in Falklands (Goose Green)', CAST(N'1982-05-28' AS Date), 21, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (433, N'Birth of Prince William', N'Birth of Prince William of Wales', CAST(N'1982-06-21' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (434, N'IRA bombings in London', N'IRA bombings in London (Hyde Park and Regents Park)', CAST(N'1982-07-20' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (435, N'Smiley emoticon first used', N'Smiley emoticon :-) said to have been used for the first time', CAST(N'1982-09-19' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (436, N'Mary Rose raised in the Solent', N'Mary Rose raised in the Solent (sank in 1545)', CAST(N'1982-10-11' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (437, N'Thames Barrier raised for first time', N'Thames Barrier raised for first time (some say first public demonstration Nov 7)', CAST(N'1982-10-31' AS Date), 7, 4)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (438, N'Channel 4 TV station launched', N'Channel 4 TV station launched – first programme ''Countdown''', CAST(N'1982-11-02' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (440, N'Greenham Common protests', N'Women''s peace protest at Greenham Common (Cruise missiles arrived 14 Nov 1983)', CAST(N'1982-12-12' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (441, N'Start of breakfast TV in Britain', N'Start of breakfast TV in Britain', CAST(N'1983-01-17' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (442, N'Lotus 1-2-3 released', N'Lotus 1-2-3 spreadsheet released', CAST(N'1983-01-25' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (443, N'Seat belt law comes into force', N'Seat belt law comes into force', CAST(N'1983-01-31' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (444, N'£1 coin', N'£1 coin into circulation in Britain', CAST(N'1983-04-21' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (446, N'Brinks Mat robbert', N'Brinks Mat robbery: 6,800 gold bars worth nearly £26 million are stolen from a vault at Heathrow Airport', CAST(N'1983-11-26' AS Date), 7, 17)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (449, N'Police Constable Yvonne Fletcher killed', N'Police Constable Yvonne Fletcher killed by gunfire from the Libyan Embassy in London', CAST(N'1984-04-17' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (451, N'York Minster struck by lightning', N'York Minster struck by lightning – the resulting fire damaged much of the building but the "Rose Window" not affected', CAST(N'1984-07-09' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (452, N'IRA bomb explodes at Brighton', N'IRA bomb explodes at Tory conference hotel in Brighton – 4 killed', CAST(N'1984-10-12' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (453, N'Miners'' strike', N'Miners'' strike — High Court orders sequestration of NUM assets', CAST(N'1984-10-24' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (454, N'Indira Gandhi assassinated', N'Indira Gandhi assassinated', CAST(N'1984-10-31' AS Date), 24, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (455, N'British Telecom privatised', N'British Telecom privatised – shares make massive gains on first day''s trading', CAST(N'1984-12-03' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (456, N'Bhopal disaster', N'At the Union Carbide India Limited (UCIL) pesticide plant in Bhopal, Madhya Pradesh. over 500,000 people were exposed to methyl isocyanate (MIC) gas and other chemicals. The highly toxic substance made its way into and around the shanty towns located near the plant.', CAST(N'1984-12-03' AS Date), 24, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (458, N'Miners'' strike ends', N'Miners agree to call off strike', CAST(N'1985-03-03' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (459, N'Al Fayed buys Harrods', N'Al Fayed buys Harrods', CAST(N'1985-03-11' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (460, N'First episode of Neighbours', N'First episode of Neighbours in Australia', CAST(N'1985-03-18' AS Date), 32, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (461, N'Heysel Stadium disaster', N'Heysel Stadium disaster in Brussels', CAST(N'1985-05-29' AS Date), 16, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (462, N'Schengen Agreement', N'Schengen Agreement on abolition of border controls agreed between Belgium, France, West Germany, Luxembourg, and The Netherlands – not implemented until 26 Mar 1995 when it also included Spain & Portugal – by 2007 there are 30 states included', CAST(N'1985-06-14' AS Date), 39, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (464, N'Wreck of Titanic found', N'Wreck of Titanic found (sank 1912)', CAST(N'1985-09-01' AS Date), 21, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (465, N'GLC abolished', N'GLC and 6 metropolitan councils abolished', CAST(N'1986-03-31' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (467, N'Mannie Shinwel dies', N'Mannie Shinwell, veteran politician, dies aged 101', CAST(N'1986-05-07' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (468, N'EC adopts the European flag', N'The European Community adopts the European flag', CAST(N'1986-05-26' AS Date), 21, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (469, N'Prince Andrew marries', N'Prince Andrew, Duke of York marries Sarah Ferguson at Westminster Abbey', CAST(N'1986-07-23' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (470, N'''Big Bang'' in the City', N'''Big Bang'' (deregulation) of the London Stock Market', CAST(N'1986-10-27' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (472, N'Terry Waite kidnapped', N'Terry Waite kidnapped in Beirut (released 17 Nov 1991)', CAST(N'1987-02-02' AS Date), 40, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (473, N'Herald of Free Enterprise capsizes', N'Car ferry Herald of Free Enterprise capsizes off Zeebrugge – 188 die', CAST(N'1987-03-06' AS Date), 16, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (474, N'Channel Tunnel excavation starts', N'Excavation begins on the Channel Tunnel', CAST(N'1987-07-01' AS Date), 21, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (475, N'Hungerford Massacre', N'Hungerford Massacre – Michael Ryan kills sixteen people with a rifle', CAST(N'1987-08-19' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (477, N'''Black Monday'' in the City of London', N'''Black Monday'' in the City of London – Stock Market crash', CAST(N'1987-10-19' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (478, N'Enniskillen bombing', N'Enniskillen bombing at a Remembrance Day ceremony', CAST(N'1987-11-08' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (479, N'King''s Cross fire', N'King''s Cross fire in London – 31 people die', CAST(N'1987-11-18' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (480, N'First ''Red Nose Day'' in UK', N'First ''Red Nose Day'' in UK, raising money for charity', CAST(N'1988-02-05' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (481, N'Copyright, Designs and Patents Act', N'Copyright, Designs and Patents Act – reformulated the statutory basis of copyright law (including performing rights) in the UK', CAST(N'1988-11-15' AS Date), 7, 17)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (482, N'Clapham Junction rail crash', N'Clapham Junction rail crash kills 35 and injures hundreds after two collisions of three commuter trains', CAST(N'1988-12-12' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (483, N'Lockerbie disaster', N'Lockerbie disaster – Pan Am flight 103 explodes over Scotland', CAST(N'1988-12-21' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (484, N'Global Positioning System launched', N'The first of 24 satellites of the Global Positioning System is placed into orbit', CAST(N'1989-02-14' AS Date), 21, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (485, N'Fatwa issued against Salman Rushdie', N'Fatwa issued against Salman Rushdie for The Satanic Verses', CAST(N'1989-02-14' AS Date), 21, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (486, N'EU decision to ban CFCs', N'EU decision to ban production of all chlorofluorocarbons (CFCs) by the end of the century', CAST(N'1989-03-02' AS Date), 21, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (487, N'Tiananmen Square massacre', N'Tanks stopped in Tiananmen Square, Peking by unknown protester', CAST(N'1989-06-05' AS Date), 19, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (489, N'Parliament first televised live', N'Proceedings of House of Commons first televised live', CAST(N'1989-11-21' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (490, N'Nelson Mandela released', N'Nelson Mandela released in South Africa', CAST(N'1990-02-11' AS Date), 29, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (491, N'Riots in London against Poll Tax', N'Riots in London against Poll Tax which had been implemented in England & Wales', CAST(N'1990-03-31' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (493, N'Iraq invades Kuwait', N'Iraq invades Kuwait', CAST(N'1990-08-02' AS Date), 21, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (494, N'German reunification', N'East and West Germany are reunited, following the fall of the Berlin Wall in the previous year', CAST(N'1990-10-03' AS Date), 3, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (496, N'Channel Tunnel excavation teams meet', N'Channel Tunnel excavation teams meet in the middle', CAST(N'1990-12-01' AS Date), 21, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (497, N'Helen Sharman is first British Astronaut in Space', N'Helen Sharman is first British Astronaut in Space', CAST(N'1991-05-18' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (498, N'Leningrad renamed St Petersburg', N'Leningrad renamed St Petersburg', CAST(N'1991-09-06' AS Date), 11, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (499, N'Robert Maxwell drowns at sea', N'Robert Maxwell drowns at sea', CAST(N'1991-11-05' AS Date), 21, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (500, N'Maastricht treaty', N'European Union formed by The Maastricht Treaty', CAST(N'1992-02-07' AS Date), 41, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (501, N'Betty Boothroyd elected as first female Speaker', N'Betty Boothroyd elected as first female Speaker of the House of Commons', CAST(N'1992-04-22' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (503, N'Black Wednesday', N'''Black Wednesday'' as Pound leaves the ERM', CAST(N'1992-09-16' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (504, N'Fire breaks out in Windsor Castle', N'Fire breaks out in Windsor Castle causing over £50 million worth of damage', CAST(N'1992-11-20' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (505, N'First female priests', N'Church of England ordains its first female priests', CAST(N'1994-03-12' AS Date), 7, 18)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (507, N'National Lottery starts', N'National Lottery starts', CAST(N'1994-11-19' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (508, N'Nick Leeson brings down Barings', N'Nick Leeson brings down Barings', CAST(N'1995-02-26' AS Date), 42, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (509, N'First item sold on Amazon', N'First item sold on Amazon.com', CAST(N'1995-07-15' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (510, N'The Queen Mother has a hip replacement', N'The Queen Mother has a hip replacement operation at 95 years old', CAST(N'1995-11-16' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (511, N'Toy Story released', N'Toy Story released – first feature-length film created completely using computer-generated imagery', CAST(N'1995-11-22' AS Date), 5, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (512, N'Galileo spacecraft arrives at Jupiter', N'Galileo spacecraft arrives at Jupiter (launched from shuttle 18 Oct 1989)', CAST(N'1995-12-07' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (514, N'Dunblane massacre', N'Gunman Thomas Hamilton kills sixteen children and one teacher at Dunblane Primary School near Stirling, Scotland on 13 March 1996, before killing himself', CAST(N'1996-03-13' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (515, N'IRA bomb explodes in Manchester', N'The IRA detonate a powerful 1,500-kilogram truck bomb on Corporation Street in the centre of Manchester, England.', CAST(N'1996-06-15' AS Date), 7, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (516, N'Dolly the sheep cloned', N'Scientists in Scotland clone a sheep (Dolly)', CAST(N'1996-07-05' AS Date), 7, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (517, N'Princess of Wales divorced', N'Charles, Prince of Wales and Diana, Princess of Wales are divorced', CAST(N'1996-08-28' AS Date), 7, 16)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (518, N'Channel 5 TV begins in UK', N'Channel 5 TV begins in UK (launched by the Spice Girls)', CAST(N'1997-03-30' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (520, N'''New'' Labour landslide victory in Britain', N'''New'' Labour landslide victory in Britain (Tony Blair replaces John Major as Prime Minister)', CAST(N'1997-05-01' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (521, N'Bank of England independence', N'Announcement that Bank of England to be made independent of Government control', CAST(N'1997-05-06' AS Date), 7, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (522, N'A computer beats a master at chess', N'First time a computer beats a master at chess (IBM''s Deep Blue v Garry Kasparov)', CAST(N'1997-05-11' AS Date), 5, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (524, N'Hong Kong returned to China', N'Hong Kong returned to China', CAST(N'1997-07-01' AS Date), 19, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (526, N'IRA declares a ceasefire', N'IRA declares a ceasefire', CAST(N'1997-07-19' AS Date), 38, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (527, N'Diana, Princess of Wales killed', N'Diana, Princess of Wales killed in car crash in Paris', CAST(N'1997-08-31' AS Date), 2, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (528, N'Land speed record breaks sound barrier for first time', N'Land speed record breaks sound barrier for first time – Wing Commander Andy Green in Thrust SSC at Black Rock Desert, USA', CAST(N'1997-09-25' AS Date), 5, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (529, N'Good Friday peace agreement in Northern Ireland', N'Good Friday peace agreement in Northern Ireland – effectively implemented in May 2007', CAST(N'1998-04-10' AS Date), 38, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (530, N'Car bomb explodes in Omagh', N'Car bomb explodes in Omagh killing 29 people', CAST(N'1998-08-14' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (532, N'International Space Station launched', N'First module of the International Space Station launched', CAST(N'1998-11-20' AS Date), 13, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (533, N'US President Bill Clinton is impeached', N'US President Bill Clinton is impeached over Monica Lewinsky scandal', CAST(N'1998-12-19' AS Date), 5, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (534, N'European Monetary Union begins', N'European Monetary Union begins – UK opts out.  By the end of the year the Euro has approximately the same value as the US Dollar.', CAST(N'1999-01-01' AS Date), 21, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (535, N'The Scottish Parliament is opened', N'The Scottish Parliament is officially opened by Queen Elizabeth – powers are officially transferred from the Scottish Office in London to the new devolved Scottish Executive in Edinburgh', CAST(N'1999-07-01' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (537, N'House of Lords reform', N'Hereditary Peers no longer have right to sit in House of Lords', CAST(N'1999-11-11' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (539, N'The Big Number Change', N'The Big Number Change takes place in the UK – affected telephone dialling codes assigned to Cardiff, Coventry, London, Northern Ireland, Portsmouth and Southampton', CAST(N'2000-04-22' AS Date), 7, 12)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (540, N'Ken Livingstone elected first Mayor of London', N'Ken Livingstone elected first Mayor of London (not to be confused with Lord Mayor of London!)', CAST(N'2000-05-04' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (541, N'Millennium footbridge opens for first time', N'Millennium footbridge over the Thames opens, but wobbles and is quickly declared dangerous and closed – finally reopened Feb 2002', CAST(N'2000-06-10' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (542, N'A chartered Air France Concorde crashes', N'A chartered Air France Concorde crashes on take-off at Paris with loss of all lives – debris on the runway blamed for causing fuel to escape and catch fire, and all Concordes grounded until 7 November 2001', CAST(N'2000-07-25' AS Date), 2, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (543, N'Derailment at Hatfield', N'Derailment at speed on the main London-North eastern line at Hatfield caused by a broken rail – Railtrack put restrictions on the rest of the network while all other suspect locations were checked', CAST(N'2000-10-17' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (548, N'FA Cup Final played at the Millennium Stadium in Cardiff', N'FA Cup Final played at the Millennium Stadium in Cardiff – first time away from Wembley since 1922', CAST(N'2001-05-12' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (549, N'New-style number plates', N'New-style number plates on road vehicles in UK eg. AB 51 ABC', CAST(N'2001-09-01' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (552, N'The Leaning Tower of Pisa reopens', N'The Leaning Tower of Pisa reopens after 11 years, still leaning', CAST(N'2001-12-15' AS Date), 4, 20)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (553, N'Euro launched', N'Twelve major countries in Europe (Austria, Belgium, Holland, Irish Republic, Italy, Luxembourg, Finland, France, Germany, Greece, Spain, Portugal) and their dependents start using the Euro instead of their old national currencies', CAST(N'2002-01-01' AS Date), 21, 8)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (556, N'Queen Mother dies', N'The Queen Mother dies, aged 101 years', CAST(N'2002-03-30' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (558, N'Steve Fossett flies nonstop round world in balloon', N'Steve Fossett becomes the first person to fly solo around the world nonstop in a balloon', CAST(N'2002-07-02' AS Date), 21, 3)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (559, N'Space Shuttle Columbia disintegrates', N'Space Shuttle Columbia disintegrates during re-entry, killing all seven astronauts aboard', CAST(N'2003-02-01' AS Date), 5, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (560, N'Start of Congestion Charge', N'Start of Congestion Charge for traffic entering central London', CAST(N'2003-02-17' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (561, N'Temperatures reach record high', N'Temperatures reach record high of 101 F (38.3 C) in Kent', CAST(N'2003-08-10' AS Date), 7, 4)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (563, N'England wins Rugby World Cup', N'England wins Rugby World Cup in nail-biting final in Australia – first northern hemisphere team to do this', CAST(N'2003-11-22' AS Date), 32, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (564, N'Saddam Hussein captured', N'Saddam Hussein captured near his home town of Tikrit (executed 30 Dec 2006)', CAST(N'2003-12-13' AS Date), 23, 6)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (565, N'Queen Mary 2 arrives in Southampton', N'Queen Mary 2 arrives in Southampton from the builder''s yard in France', CAST(N'2003-12-26' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (566, N'Alistair Cooke dies', N'Alistair Cooke dies at the age of 95 – until four weeks previously, and since 1946, he had broadcast his regular ''Letter from America'' on BBC radio', CAST(N'2004-03-29' AS Date), 7, 9)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (567, N'Ireland bans smoking', N'Ireland becomes first country in the world to ban smoking in public places', CAST(N'2004-03-29' AS Date), 38, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (568, N'Enlargement of the European Union', N'Enlargement of the European Union to include 25 members by the entry of 10 new states: Estonia, Latvia, Lithuania, Poland, Czech Republic, Slovakia, Hungary, Slovenia, Malta, Cyprus.', CAST(N'2004-05-01' AS Date), 21, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (569, N'Kyoto Protocol starts', N'Kyoto Protocol on climate change came into force', CAST(N'2005-02-16' AS Date), 21, 4)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (570, N'Ban on hunting with dogs', N'Ban on hunting with dogs came into force in England & Wales (had already been a similar law for about two years in Scotland)', CAST(N'2005-02-18' AS Date), 7, 17)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (571, N'Death of Pope John Paul II', N'Death of Pope John Paul II, first non-Italian Pope for 450 years when elected in 1978', CAST(N'2005-04-02' AS Date), 4, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (572, N'Pope Benedict XVI elected', N'Pope Benedict XVI elected – first German Pope for about 1,000 years', CAST(N'2005-04-19' AS Date), 43, 18)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (573, N'London chosen for 2012 Olympics', N'London chosen as venue for the 2012 Olympic Games', CAST(N'2005-07-06' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (574, N'Suicide bombers attack London', N'A series of coordinated terrorist suicide bomb attacks in central London target civilians using the public transport system during the rush hour', CAST(N'2005-07-07' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (576, N'England regain the ''Ashes''', N'England regain the ''Ashes'' after a gripping Test series (but are whitewashed 5-0 in the return series in Australia 2007)', CAST(N'2005-09-12' AS Date), 7, 7)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (577, N'Angela Merkel becomes first female Chancellor', N'Angela Merkel becomes first female Chancellor of Germany', CAST(N'2005-11-22' AS Date), 3, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (578, N'John Sentamu becomes Archbishop of York', N'John Sentamu becomes Archbishop of York; the first black archbishop in the Church of England', CAST(N'2005-11-30' AS Date), 7, 18)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (579, N'Last Routemaster bus runs', N'Last Routemaster bus runs on regular service in London', CAST(N'2005-12-09' AS Date), 7, 14)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (580, N'Explosions at the Buncefield Oil Depot', N'Explosions at the Buncefield Oil Depot in Hemel Hempstead', CAST(N'2005-12-11' AS Date), 7, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (581, N'Same-sex civil partnerships begin', N'Same-sex civil partnerships begin – famously, on this day, between Elton John and David Furnish', CAST(N'2005-12-21' AS Date), 7, 11)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (582, N'Welsh Assembly Building opened', N'Welsh Assembly Building opened by the Queen', CAST(N'2006-03-01' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (583, N'Prohibition of smoking in Scotland', N'Prohibition of smoking in enclosed public places in Scotland', CAST(N'2006-03-26' AS Date), 7, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (586, N'Saddam Hussein executed', N'Saddam Hussein executed', CAST(N'2006-12-30' AS Date), 23, 5)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (587, N'Further enlargement of the European Union', N'Further enlargement of the European Union to include Bulgaria and Romania', CAST(N'2007-01-01' AS Date), 21, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (589, N'A Northern Ireland Executive formed', N'A Northern Ireland Executive formed under the leadership of Ian Paisley (DUP) and Martin McGuinness (Sinn Fein)', CAST(N'2007-05-08' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (590, N'Tony Blair resigns as Prime Minister', N'Tony Blair resigns as Prime Minister after 10 years – replaced by Gordon Brown', CAST(N'2007-06-27' AS Date), 7, 1)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (591, N'Prohibition of smoking in England', N'Prohibition of smoking in enclosed public places in England (thus completing cover of the entire UK)', CAST(N'2007-07-01' AS Date), 7, 10)
GO
INSERT tblEvent (EventID, EventName, EventDetails, EventDate, CountryID, CategoryID) VALUES (592, N'Seventh and final Harry Potter book', N'People queue up to buy the seventh and final Harry Potter book', CAST(N'2007-07-21' AS Date), 7, 9)
GO
SET IDENTITY_INSERT tblEvent OFF
GO

---- add 
--ALTER TABLE tblCategory ADD  CONSTRAINT aaaaaCategory_PK PRIMARY KEY NONCLUSTERED 
--(
--	CategoryID ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
--GO
--/****** Object:  Index aaaaaContinent_PK    Script Date: 26/01/2017 10:16:20 ******/
--ALTER TABLE tblContinent ADD  CONSTRAINT aaaaaContinent_PK PRIMARY KEY NONCLUSTERED 
--(
--	ContinentID ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
--GO
--/****** Object:  Index aaaaaCountry_PK    Script Date: 26/01/2017 10:16:20 ******/
--ALTER TABLE tblCountry ADD  CONSTRAINT aaaaaCountry_PK PRIMARY KEY NONCLUSTERED 
--(
--	CountryID ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
--GO
--/****** Object:  Index aaaaaEvent_PK    Script Date: 26/01/2017 10:16:20 ******/
--ALTER TABLE tblEvent ADD  CONSTRAINT aaaaaEvent_PK PRIMARY KEY NONCLUSTERED 
--(
--	EventID ASC
--)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
--GO

-- add relationships
ALTER TABLE tblCountry  WITH CHECK ADD  CONSTRAINT FK_tblCountry_tblContinent FOREIGN KEY(ContinentID)
REFERENCES tblContinent (ContinentID)
GO
ALTER TABLE tblCountry CHECK CONSTRAINT FK_tblCountry_tblContinent
GO
ALTER TABLE tblEvent  WITH CHECK ADD  CONSTRAINT FK_tblEvent_tblCategory1 FOREIGN KEY(CategoryID)
REFERENCES tblCategory (CategoryID)
GO
ALTER TABLE tblEvent CHECK CONSTRAINT FK_tblEvent_tblCategory1
GO
ALTER TABLE tblEvent  WITH CHECK ADD  CONSTRAINT FK_tblEvent_tblCountry FOREIGN KEY(CountryID)
REFERENCES tblCountry (CountryID)
GO
ALTER TABLE tblEvent CHECK CONSTRAINT FK_tblEvent_tblCountry
GO

-- add a column to the continent table
ALTER TABLE tblContinent
	ADD Summary varchar(100)
GO

-- set some (but not all) values
UPDATE tblContinent SET Summary = 'Big' WHERE ContinentID = 1
UPDATE tblContinent SET Summary = 'Biggish' WHERE ContinentID = 2
UPDATE tblContinent SET Summary = 'Home' WHERE ContinentID = 3
UPDATE tblContinent SET Summary = 'Lots of trees' WHERE ContinentID = 5
UPDATE tblContinent SET Summary = 'Full of penguins' WHERE ContinentID = 7