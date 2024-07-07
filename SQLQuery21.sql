USE [TEACHERS]

GO
/*16. Cоздать представления (VIEW):
16.2. Все фамилии учителей.
16.3. Идентификатор, фамилия учителя, его должность, общая з\п
(сортировать по з\п).
16.4. Идентификационный номер, фамилия, номер телефона (только те, у
кого есть номер телефона).
*/

-- 16.1
CREATE VIEW  ProfNameInfo
AS 
SELECT Post.Name
FROM Post 

SELECT Name AS Profession
FROM ProfNameInfo

GO
-- 16.2
CREATE VIEW  TeachersSurnameInfo
AS 
SELECT Teacher.SurName , Teacher.Id
FROM Teacher 

SELECT SurName AS TeachersSurname
FROM TeachersSurnameInfo

GO

-- 16.3
CREATE VIEW  TeachersInfo
AS 
SELECT T.Id, T.SurName, P.Name AS Profession, T.Salary + T.Rise AS TotalSalary 
FROM Teacher AS T
JOIN Post AS P
ON T.IdPost = P.Id

SELECT Id, SurName , Profession , TotalSalary
FROM TeachersInfo
ORDER BY TotalSalary DESC

GO

-- 16.4
CREATE VIEW  TeachersInformation
AS 
SELECT T.Id, T.SurName, P.Id AS PostId, T.PhoneNumber
FROM Teacher AS T
JOIN Post AS P
ON T.IdPost = P.Id

SELECT Id, SurName , PostId , PhoneNumber
FROM TeachersInformation
WHERE PhoneNumber IS NOT NULL
GO