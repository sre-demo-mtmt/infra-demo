# テスト
provider "aws" {
  region = "ap-northeast-1"
}

data "aws_iam_role" "lambda_exec" {
  name = "demo_lambda_role"  # 既にAWS上に存在するIAMロール名を指定
}

resource "aws_lambda_function" "demo" {
  function_name = "demo_lambda"
  handler       = "index.handler"
  runtime       = "nodejs18.x"
  role          = data.aws_iam_role.lambda_exec.arn

  filename         = "lambda_function_payload.zip"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")
}
