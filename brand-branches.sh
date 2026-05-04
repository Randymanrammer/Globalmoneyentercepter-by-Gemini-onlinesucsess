#!/bin/bash
# Script to Brand the 12 Branches

branches=("alpha" "beta" "gamma" "delta" "epsilon" "zeta" "eta" "theta" "iota" "kappa" "lambda" "omega")

for i in "${!branches[@]}"; do
  branch=${branches[$i]}
  git checkout $branch

  # Create a unique identity file for each node
  echo "{ \"node_id\": $((i+1)), \"branch_name\": \"$branch\", \"status\": \"active\" }" > config.json

  git add config.json
  git commit -m "Branding Node: $branch"
  git push origin $branch
done

git checkout omega
