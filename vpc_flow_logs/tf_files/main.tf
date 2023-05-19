#----------------------------------------------------------------#
##                     Creating VPCs                            ##
#----------------------------------------------------------------#

resource "aws_vpc" "main" {
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "VPC00"
    }
}

resource "aws_vpc" "main1" {
    cidr_block = "11.0.0.0/24"
    tags = {
        Name = "VPC01"
    }
}

#----------------------------------------------------------------#
##                        VPC Data                              ##
#----------------------------------------------------------------#

data "aws_vpc" "main" {
  id = aws_vpc.main
}

data "aws_vpc" "main1" {
  id = aws_vpc.main1
}
#----------------------------------------------------------------#
##             Creating Flow Logs for VPCS                      ##
#----------------------------------------------------------------#

resource "aws_flow_log" "flow_logs_example1" {
  iam_role_arn = aws_iam_role.example.arn
  log_destination = aws_cloudwatch_log_group.example.arn
  traffic_type = "ALL"
  vpc_id = aws_vpc.main1.id
}

resource "aws_cloudwatch_log_group" "example" {
  name = "vpc_logs"
}

#----------------------------------------------------------------#
##             Creating Flow Log Role & Policy                  ##
#----------------------------------------------------------------#


resource "aws_iam_role" "example" {
  name = "example"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "example" {
  name = "example"
  role = aws_iam_role.example.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}
