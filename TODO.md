We should post a message for each commit in the push.

```
sender=$(cat example.json | jq ".sender.login")
repo_name=$(cat example.json | jq ".repository.name")
commit_messages=$(cat example.json | jq ".commits[].message")
commit_urls=$(cat example.json | jq ".commits[].url")
```
