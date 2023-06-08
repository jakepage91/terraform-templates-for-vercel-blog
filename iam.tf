resource "aws_iam_policy" "NAME_policy" {
  name        = "NAME_policy"
  description = "NAME recommended IAM policy"

  policy = file("policy.json")

  tags = {
    App  = "NAME"
    Owner = var.owner
  }
}

resource "aws_iam_role" "NAME_role" {
  name = "NAME_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = "RoleForEC2"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    App  = "NAME"
    Owner = var.owner
  }
}

resource "aws_iam_policy_attachment" "NAME_attach_policy" {
  name       = "NAME_attach_policy"
  roles      = [aws_iam_role.NAME_role.name]
  policy_arn = aws_iam_policy.NAME_policy.arn
}

resource "aws_iam_instance_profile" "NAME_instance_profile" {
  name = "NAME_instance_profile"
  role = aws_iam_role.NAME_role.name

  tags = {
    App  = "NAME"
    Owner = var.owner
  }  
}