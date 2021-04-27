/*
 * Calculates the hashtags that are commonly used with the hashtag #coronavirus
 */

SELECT 
    tag, 
    count(*) as count
FROM (
    SELECT DISTINCT
        data->>'id' as id_tweets,
        '#' || (jsonb_array_elements(COALESCE(data->'entities'->'hashtags', '[]') || COALESCE(data->'extended_tweet'->'entities'->'hashtags', '[]'))->>'text')::TEXT as tag
    FROM tweets_jsonb
    WHERE
        data->'entities'->'hashtags' @> '[{"text": "coronavirus"}]' or
        data->'extended_tweet'->'entities'->'hashtags' @> '[{"text": "coronavirus"}]'
    ) t
GROUP BY (1)
ORDER BY count DESC, tag
LIMIT 1000;
