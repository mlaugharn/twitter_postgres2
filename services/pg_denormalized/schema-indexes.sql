-- create index tweet_tags_idx_tag_id_tweets on tweet_tags(tag, id_tweets);
--
-- create index tweet_tags_idx_tag on tweets_jsonb'text' using gin(to_tsvector('english', tag));
--
create index on tweets_jsonb using GIN ((data->'extended_tweet'->'entities'->'hashtags'));
create index on tweets_jsonb using GIN ((data->'entities'->'hashtags'));
create index on tweets_jsonb using GIN ((to_tsvector('english', data->'extended_tweet'->>'full_text')));
create index on tweets_jsonb using GIN ((to_tsvector('english', data->>'text')));
create index on tweets_jsonb using GIN ((data->'lang'));
create index on tweets_jsonb using GIN ((to_tsvector('english', coalesce(data->'extended_tweet'->>'full_text', data->>'text'))))
