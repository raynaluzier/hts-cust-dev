# AWS Plugin for TFLint
plugin "aws" {
    enabled = true
    version = "0.12.0"
    source  = "github.com/terraform-linters/tflint-ruleset-aws"
}

# https://github.com/terraform-linters/tflint/tree/master/docs/rules
rule "terraform_comment_syntax" {
  enabled = true
}