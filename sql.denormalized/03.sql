/*
 * Calculates the languages that commonly use the hashtag #coronavirus
 */

SELECT 
    lang,
    count(*) as count
FROM (
    SELECT DISTINCT 
    data->'id' as id_tweets,
    data->>'lang' as lang
    FROM tweets_jsonb
    WHERE 
        data->'entities'->'hashtags' @> '[{"text": "coronavirus"}]' or
        data->'extended_tweet'->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
    
) t
GROUP BY lang
ORDER BY count DESC, lang
