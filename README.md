# Examining-Article-Shareability 
After submitting two years of published content on its site to academics for text-mining analysis, the business leaders of Mashable.com now would like to know whether that analysis revealed any valuable insights into what makes a more successful Mashable article.

While previous studies have shown that many hard-wired practices undertaken at Mashable have strong effects on the shareability of articles (search engine and social media optimization, striking visual presentation, selected subject areas, etc.), not many studies have been explored the effect word choice (originality, subjectivity and mood) throughout articles has on their shareability. This study uses text-mining in an attempt to see what secrets to shareability success can be found on a word-to-word level.

## Key questions explored

In our analytic study we attempted to answer the following questions:

1. Does the text-mined analysis reveal any strong indicators of what makes a Mashable article more or less shareable?

2. Among the text-mined attributes, which ones have the most effect on shareability?

3. What attributes do Mashable’s most shared articles have in common from a text-mining perspective?

4. From the same perspective, how do the most successful stories differ from Mashable’s least-shared and middle-of-the-road articles?

5. How does Mashable’s content break down from a text-mining perspective?

## Executive summary

All information gleaned from this study into text-mining analytics should be taken merely as complementary considerations in content strategy, as a linear regression analysis of the dataset found that, at best, the text-mining data examined can claim to account for at best merely 9 percent of the variability seen in article sharing. This is consistent with initial expectations for the dataset. With that fact in mind, the analysis does not find a need for a reporter to totally revamp his or her style of writing or for editors to look for something different when hiring new staff. These suggestions can be offered to the writers and editors as a way to give their article “a little extra boost” toward shareability.

With 91 percent of the puzzle left unsolved by this dataset, it’s worth acknowledging some of the well-known keys to article virality and shareability that are not accounted for in this text-mining dataset. The classic journalism TIPCUP acronym still provides a solid baseline for what’s newsworthy and worth pursuing: timeliness, proximity, impact, conflict, unusualness and prominence. These still have their hand in shareworthiness to a degree but can’t be measured well by the text-mining algorithm used here. We see much of the share-variability puzzle be explained in other areas of the content strategy -- and backed up by previous studies of the online news space -- including speed with which things are published in relation to when the the news broke, how articles are optimized for search engines and social media, and news selection with respect to Mashable’s brand identity, among others.

With that caveat out of the way, a group of the 1,000 most-shared articles were compared with the 1,000 least-shared and 1,000 that fell in the middle. Results showed that many of the most-shared articles appeared to be written with more personality than their less-successful counterparts. This makes sense with Mashable’s branding. There are countless news websites offering an attempt at more objective, view-from-nowhere accounts of the day’s news and developments. Mashable offers articles from writers with subject-matter “obsessions” rather than the standard journalism “beats,” carving a niche for our writers to pen articles where their passion and emotion for their subject matter shows. Analysis shows that personality coming through in writing can make an article potentially more shareable whether the writer’s tone is positive or negative, though more success is seen with a positive tone.

That trend of showing personality in writing appears to offer a boost to shareability when applied to article headlines as well. This finding is consistent with real-world successes seen at Mashable as well as rival sites Buzzfeed and Upworthy. A headline is often a reader’s first impression of an article, and setting the attractive tone of the article’s personality in that first moment can aid success.

Other noted differences in our most successful stories included a tendency to include multiple images in a story, reaffirming that visual appeal has a say in viral potential. Also, analysis of keyword tagging in articles suggests that subject matter can make a difference.

The text-mining dataset was also run through a cluster analysis to see if the site’s content could be group in any way undetectable to the human eye. Multiple attempts were made to find meaningful clusters among the dataset, but no results were significant enough to merit conclusion in this report. At best, a mere 273 articles broke apart from the mass of more than 38,000.

The key takeaway from this analysis is that the most shared and attractive Mashable articles appear to be the ones where the writer’s passion and emotion about their subject matter shines through. This is the niche that sets the site apart from most of the online news competition, and it is worth reinforcing.

## About our dataset

The dataset provides us with 58 attributes offering details for 39,645 articles. They range from headline and article body length, to counts of rich media objects and links, to sentiment analysis (How subjective is the language in this article? Does the writing use more positive or negative words?).

While countless past studies have shown the effect headline lengths and use of rich media can have on readability and shareability of articles, far less has been determined with respect to the more technical text-mining details (positive or negative sentiments in the writing, number of unique words used, etc.).

## Hurdles faced

Some troubling parts of the dataset have the potential to throw off any analysis. As part of our data due diligence, the following steps were taken to prevent any ill influence, including:

- Eliminating binary (evaluated with only a 1 or 0 coded standing for a “yes” or “no”) attributes that don’t appear to have an appreciable effect on the shareability of articles, namely the series of `weekday_is` and `data_channel_is` attributes. The `is_weekend` field remained, however, because a difference could be seen between items published on the weekend vs. on weekdays.

- To prevent right-skewed distributions in the dataset (of which there are many) from introducing bias into the model, skewed categories were transformed using a log10 or square-root function, depending on the proper approach for the particular variable.

- Excluding instances missing too many variables. The count of incomplete observations was around 1,200. Those results were excluded from analysis. 

- Deleting variables with unexplained negative values. This includes `kw_min_min` and `kw_avg_min`.

- Eliminating instances including apparent errors causing outliers in initial distributions. The most notable case is a value of 1042 in the `n_non_stop_words`, a variable in which only values between 0 and 1 are possible.

- Managing redundancy among variables. Many of the variables presented in the dataset were mere variations on other variables. For example, with respect to keywords, there were nine variables in the set, all broken down by minimum, maximum and average shares of the best, worst and average keyword included in each article. In order to keep one variable being told many ways from having more influence on the statistical models than it should, only one keyword variable was kept. Redundancies were also found among sentiment analysis and polarity variables. In the end, a set of the variables pertaining to the headlines alone and one pertaining to the body text alone were kept. “Absolute” versions of the variable that combined the two were eliminated.

In the end, 26 variables were used in the regression and clustering exercises. In the exploratory data analysis of the three segments of articles, all variables were examined.

## Evaluating shareability

The tool of choice for statistical analysis was R. Determining the effect of different text-mining attributes was accomplished with a linear regression model. That regression offered up a “coefficient of determination” for each attribute included in the model, laying out each attribute’s potential to explain what makes an article shareable. The sum of those coefficients of determination gives an idea of how much sharing variability the revelations in the text-mining analysis as a whole can account for. 

The linear regression produced a coefficient of determination of 0.09181, telling us that the text-mining dataset can only account for, at best, 9 percent of the variability seen among the articles (full results in appendix). A low number here as expected from the outset. With 91 percent of the puzzle unsolved, any recommendations in this report are being treated as complementary information that can boost success, as opposed to workflow- or business model-changing revelations.

Cross-validation on the dataset ensured ensure the values were as accurate as can be. This process splits the data into different “folds” and tests the folds against each other over and over again to ensure findings are consistent. The coefficient of determination values of the folds remained around the 8-9 percent range, giving us confidence that the regression’s results are reliable.

## What makes the cream rise?

Questions of how our most shareable content compares with poorly shared and middling content was accomplished through exploratory data analysis of all available variables. Groups consisting of the top and bottom 1,000 articles as well as another 1,000 from the middle of the deck underwent summarization to see if there are any major differences in average or median measurements of the different characteristics among the three groups (full results in appendix). 

The biggest takeaway among this data exploration came with respect to writer subjectivity and emotion conveyed. Multiple variables measuring subjectivity vs. objectivity and emotion vs. cold, factual news presentation in both the headline and article text fields showed that the writer’s personality tended to shine through more in the best-shared articles. This suggests that writing with a voice can have a role in virality. Results showed that personality can offer a potential boost whether the writers is using a positive or negative tone, though success was seen more often with a positive tone.

When it comes to global subjectivity, which measures the rate of which an article is written more subjectively or objectively, the most-shared group tended to employ more subjective language than its counterparts. The same was found in analysis of headline subjectivity. Headlines of the more successful articles also tended to use more emotional language than the rest, according to measures of sentiment polarity. 

Seeing that the text for the most-shared articles tended to be more written personally than the others isn’t exactly a surprise The viral successes of Mashable, as well as counterparts Upworthy and Buzzfeed, made this idea already known. There are countless news websites offering an attempt at more objective, view-from-nowhere accounts of the day’s news and developments. Mashable, Buzzfeed and Upworthy carved out their niche offering articles by writers with subject-matter “obsessions” rather than the standard journalism “beats,” carving a niche for them to pen articles where their passion and emotion for their subject matter shows. 

Other noted differences in our most successful stories included a tendency to include multiple images in a story, reaffirming that visual appeal has a say in viral potential. Also, analysis of keyword tagging in articles suggests that subject matter can make a difference.

## How would our articles group themselves?

Finding new ways in which Mashable’s content breaks down was attempted with unsupervised k-means clustering. In the process, a model looked at all the stories and the data on them, attempting to find natural groupings of articles within our content (full results in appendix).

The number of clusters, two in this case, was determined using an elbow plot, which demonstrates how much information is gained from each number of potential groupings.

Early attempts to form clusters were extremely unsuccessful, with less than 100 articles breaking away from the rest in a meaningful way. In an attempt to normalize the share figures, shares for articles were capped at 40,000. That figure is still allowed for a statistically appropriate amount of variability in the dataset. The hope was the extreme outliers wouldn’t wreck the clustering efforts under this new model.

Unfortunately, later attempts weren’t much more successful, and analysis of the clusters was scrapped as a result, with little of importance expected to be found valuable and applicable to Mashable as a whole from the analysis.

## Conclusions

First off, it’s worth repeating again that these conclusions should be treated as complementary suggestions as opposed to tactics-altering edicts in our content strategy. The fact that the text-mining data can only account for 9 percent of the share variability means plenty of other pieces make up the puzzle, and many of those other pieces will likely be larger.

Mashable should continue to put forth content that is written with more personality and passion than your typical objective-sounding newsroom. Taking a subjective tone not only sets us apart in the news market, it feed a niche hunger for content with personality.

Making that personality shine in the headlines is also important in boosting potential shareability. Headlines are often a reader’s first -- and oftentimes only -- impression. Set the tone for what they can expect here, and they may be hooked into reading and even sharing.

Also, it could be helpful to incorporate multiple images into articles. Online reader attention is at a premium, and visuals can break things up just as a reader is starting to consider moving on. Our most successful articles tended to include more than one image.

Mashable has made strong inroads carving out a niche for enthusiast-written articles about the day’s events. What we see in this analysis is that tone is what can boost an article’s potential to be shared. So for the writers, being themselves, keep it up. For others who tend to write more objectively, considering where you can get away with flashing some personality may help your articles take off.
