library(tidyverse)
library(purrr)

#import dataframe
p <- read_csv("OnlineNewsPopularity1.csv")

#import version of dataframe without url and timedelta fields
fortidy <- read_csv("fortidy.csv")

#plot histograms of all variables to check for skewness
ggplot(gather(fortidy), aes(value)) + 
     geom_histogram(bins = 10) + 
     facet_wrap(~key, scales = 'free_x')
ggsave("hist.png", p, height=11, width=8.5, dpi=300)


#perform log transformations on right-skewed variables that don't include 0s
ptrans <- fortidy %>%
   mutate_at(vars(2, 22:26, 43), log)

#perform sqrt transformations on right-skewed variables that include 0s
ptrans <- ptrans %>%
   mutate_at(vars(6:9,12,13,16:20,29,34), sqrt)

#create the linear model
mod <- lm(shares ~ ., data = ptrans)

summary(mod)

#linear model for untransformed dataset
untouchedmod <- lm(shares ~ ., data = fortidy)

summary(untouchedmod)

#most notable difference among the 1,000 most shared articles,
#the 1,000 least shared, and 1,000 right in the middle

ggplot(q, aes(x = grouping, y = num_imgs)) +
    geom_boxplot(aes(group = grouping))

ggplot(q, aes(x = grouping, y = kw_avg_max)) +
    geom_boxplot(aes(group = grouping))

ggplot(q, aes(x = grouping, y = global_subjectivity)) +
    geom_boxplot(aes(group = grouping))

ggplot(q, aes(x = grouping, y = avg_positive_polarity)) +
    geom_boxplot(aes(group = grouping))

ggplot(q, aes(x = grouping, y = avg_negative_polarity)) +
    geom_boxplot(aes(group = grouping))

ggplot(q, aes(x = grouping, y = title_subjectivity)) +
    geom_boxplot(aes(group = grouping))

ggplot(q, aes(x = grouping, y = abs_title_sentiment_polarity)) +
    geom_boxplot(aes(group = grouping))

#setting up data for clustering
paredown <- ptrans %>%
   select(n_tokens_title, n_tokens_content, n_unique_tokens, num_hrefs, num_self_hrefs, num_imgs, num_videos, average_token_length, num_keywords, kw_avg_avg, self_reference_avg_sharess, is_weekend, LDA_00, LDA_01, LDA_02, LDA_03, LDA_04, global_subjectivity, global_sentiment_polarity, global_rate_positive_words, global_rate_negative_words, title_subjectivity, title_sentiment_polarity, abs_title_subjectivity, abs_title_sentiment_polarity)
scaleddata <- scale(paredown)
scaleddist <- dist(scaleddata)
hcdata <- hclust(scaleddist, method = "complete")

#create elbow plot to determine appropriate number of clusters
tot_withinss <- map_dbl(1:10, function(k){
  model <- kmeans(x = paredown, centers = k)
  model$tot.withinss
})
elbow_df <- data.frame(
  k = 1:10,
  tot_withinss = tot_withinss
)
ggplot(elbow_df, aes(x = k, y = tot_withinss)) +
  geom_line() +
  scale_x_continuous(breaks = 1:10)

#Attempting with three clusters
threeclusts <- cutree(hcdata, k = 3)
segment_threeclusts <- mutate(paredown, cluster = threeclusts)
count(segment_threeclusts, cluster)

#Attempting with two clusters
twoclusts <- cutree(hcdata, k = 2)
segment_twoclusts <- mutate(paredown, cluster = twoclusts)
count(segment_twoclusts, cluster)
