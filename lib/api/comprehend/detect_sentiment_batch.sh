p6_aws_comprehend_detect_sentiment_batch() {
    local text_list="$1"
    local language_code="$2"
    shift 2

    p6_run_write_cmd aws comprehend batch-detect-sentiment --text-list $text_list --language-code $language_code "$@"
}