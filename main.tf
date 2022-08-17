provider "aws" {
  region  = "us-east-1"
}
variable "acc_no" {
  default = "181770501629"
}
variable "access_key" {
  default = "AKIASUUS5XX652Q62USQ"
}
variable "secret_access_key" {
  default = "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"
}
resource "aws_iam_user" "sowmi"{
    name = "sowmi"
	}
resource "aws_iam_user" "subha"{
    name = "subha"
	}
resource "aws_iam_user" "saran"{
    name = "saran"
	}
resource "aws_iam_group" "cse"{
    name = "cse"
	}
resource "aws_iam_group_membership" "team" {
  name = "tf-testing-group-membership"

  users = [
    aws_iam_user.sowmi.name,
    aws_iam_user.subha.name,
	aws_iam_user.saran.name
	
  ]

  group = aws_iam_group.cse.name
}

resource "aws_iam_group_policy_attachment" "test-attach" {
  group      = aws_iam_group.cse.name
  policy_arn = "arn:aws:iam::aws:policy/IAMFullAccess"
}
