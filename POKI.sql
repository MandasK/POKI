--What grades are stored in the database?
select *
from Grade;
--What emotions may be associated with a poem?
select *
from Emotion;
--How many poems are in the database?
select Count(Id) as 'amountofpoems'
from Poem;
--Sort authors alphabetically by name. What are the names of the top 76 authors?
--Starting with the above query, add the grade of each of the authors.
--Starting with the above query, add the recorded gender of each of the authors.
select top 76 *,
g.Name,
gg.Name
from Author
left join Grade g on Author.GradeId = g.Id
left join Gender gg on Author.GenderId = gg.id
order by Author.Name;
--What is the total number of words in all poems in the database?
select Sum(WordCount) as 'Total#Words'
from Poem;
--Which poem has the fewest characters?
select MIN(CharCount)
from Poem;
--How many authors are in the third grade?
select Count(GradeId)
from Author
Where GradeId = 3;
--How many authors are in the first, second or third grades?
select Count(GradeId)
from Author
Where GradeId Between 1 AND 3;
--What is the total number of poems written by fourth graders?
select Count(p.Title) as'numPoems4thgrade'--a.*, p.*
from Poem p
join Author a on p.AuthorId = a.id
Where a.GradeId = 4;
--How many poems are there per grade?
select Count(p.title) as 'numPerGrade'
from Poem p
join Author a on p.AuthorId = a.id
Group by a.GradeId;
--How many poems are there per grade?
select Count(*) as 'numAuthors'
from Author a
join Grade g on a.GradeId = g.Id
group by g.Name;
--What is the title of the poem that has the most words?
select  
title,
wordCount
from Poem
Where
	WordCount = (
		Select	
			MAX(WordCount)
			From Poem
			);
----How many poems have an emotion of sadness?
select *
from Emotion

select Count(*)
from PoemEmotion p
join Emotion e on p.EmotionId = e.Id
where e.id = 3;

--How many poems are not associated with any emotion?
select Count(*)
from Poem p
left Join PoemEmotion pe
on p.id = pe.PoemId
where EmotionId is null;

--Which author(s) have the most poems? (Remember authors can have the same name.)
Select Top(10) *
From
(select authorId, Count(Id) as 'numPoems'
from Poem
group by AuthorId) z
Order by numPoems desc;

--Which grade has the largest number of poems with an emotion of joy?
Select a.GradeId, Count(p.id) as 'count'
from Poem p
join PoemEmotion pe
on p.id = pe.PoemId
join author a 
on p.AuthorId = a.Id
where pe.EmotionId = 4
group by a.GradeId
order by count desc;
--Which gender has the least number of poems with an emotion of fear?
Select a.GenderId, Count(p.Id) as 'count'
from Poem p
join PoemEmotion pe
on p.id=pe.PoemId
join Author a
on p.AuthorId = a.Id
where pe.EmotionId = 4
group by a.GenderId
order by count;


