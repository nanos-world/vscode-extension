# Docgen for the extension

This generates EmmyLua annotations from the Nanos World API repository via a GitHub workflow and pushes them to the `docgen-output` branch  
Right now this runs only when this branch is pushed to, however the final version will periodically check the latest commit to the API to see if the docs need rebuilding

## Run Locally

You can run the action locally using https://github.com/github/local-action:

1. Copy `.env.template` to `.env.local`
2. Set `INPUT_GITHUB-TOKEN` to a personal access token with access to the following endpoints:
    - `GET /repos/{owner}/{repo}/git/trees/{tree_sha}`
    - `GET /repos/{owner}/{repo}/contents/{path}`
3. `npm run start`
