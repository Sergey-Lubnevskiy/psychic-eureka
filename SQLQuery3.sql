Use Game
declare @a int = rand() * 8
declare @b int = rand() * 8
declare @c int = rand() * 8
declare @score int
SELECT @score = score FROM game_score
SELECT @a AS ' ', @b AS ' ', @c AS ' '

if @a = @b AND @b = @c AND @c = @a set @score += 50
else set @score -= 10

if @a = 7 And @b = 7 AND @c =7
begin
select 'Ты выиграл' as 'Результат'
set @score += 25000
end

if @score = 0 select'Проиграл, бывает'

UPDATE game_score SET score = @score
select @score AS score