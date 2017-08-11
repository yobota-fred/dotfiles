HEROKU_APP_NAME=$1
GIT_REMOTE_NAME="heroku/$HEROKU_APP_NAME"

heroku git:remote -a "$HEROKU_APP_NAME" -r "$GIT_REMOTE_NAME"
git remote set-url --push "$GIT_REMOTE_NAME" DISABLE
