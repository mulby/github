-- | The pull request review comments API as described at
-- <http://developer.github.com/v3/pulls/comments/>.
module Github.PullRequests.ReviewComments (
 pullRequestReviewComments
,pullRequestReviewComments'
,pullRequestReviewComment
,pullRequestReviewComment'
,module Github.Data
) where

import Github.Data
import Github.Private

-- | All the comments on a pull request with the given ID.
-- | With authentication.
--
-- > pullRequestReviewComments (Just ("github-username", "github-password")) "thoughtbot" "factory_girl" 256
pullRequestReviewComments' :: Maybe GithubAuth -> String -> String -> Int -> IO (Either Error [Comment])
pullRequestReviewComments' auth userName repo number = 
  githubGet' auth ["repos", userName, repo, "pulls", show number, "comments"]

-- | All the comments on a pull request with the given ID.
--
-- > pullRequestReviewComments "thoughtbot" "factory_girl" 256
pullRequestReviewComments :: String -> String -> Int -> IO (Either Error [Comment])
pullRequestReviewComments = pullRequestReviewComments' Nothing

-- | One comment on a pull request, by the comment's ID.
-- | With authentication.
--
-- > pullRequestReviewComments (Just ("github-username", "github-password")) "thoughtbot" "factory_girl" 301819
pullRequestReviewComment' :: Maybe GithubAuth -> String -> String -> Int -> IO (Either Error Comment)
pullRequestReviewComment' auth userName repo prCommentId =
  githubGet' auth ["repos", userName, repo, "pulls", "comments", show prCommentId]

-- | One comment on a pull request, by the comment's ID.
--
-- > pullRequestReviewComment "thoughtbot" "factory_girl" 301819
pullRequestReviewComment :: String -> String -> Int -> IO (Either Error Comment)
pullRequestReviewComment = pullRequestReviewComment' Nothing
