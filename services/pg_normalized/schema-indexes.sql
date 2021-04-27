create index tweet_tags_idx_tag_id_tweets on tweet_tags(tag, id_tweets);

create index tweet_tags_idx_id_tweets_tag on tweet_tags(id_tweets, tag);

create index tweets_idx_id_tweets_lang on tweets(id_tweets, lang);

create index tweets_idx_lang_text on tweets using gin(to_tsvector('english', text));

