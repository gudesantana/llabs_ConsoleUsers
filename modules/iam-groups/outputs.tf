output "groups" {
  value = {
    for group in aws_iam_group.groups :
    group.name => {
      name = group.name
      arn  = group.arn
    }
  }
  description = "Created groups in the format `{ name = { name, arn }}`"
}
