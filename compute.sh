compute() {
    local commit="$1"

    (
        printf "commit %s\0" $(git --no-replace-objects cat-file commit "$commit" | wc -c)
        git cat-file commit "$commit"
    ) | sha1sum | cut -f1 -d' '
}
