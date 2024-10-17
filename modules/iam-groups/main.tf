/**
 * Create groups
 */

resource "aws_iam_group" "groups" {
  for_each = var.groups

  name = each.key
}


/**
 * Attach policies to groups
 */

locals {
  // Create a list of group/policy association in the format [{group, policy}] 
  policy_groups = [
    for group, prop in var.groups : [
      for policy in prop["policies"] : merge({ group = group }, { policy = policy })
    ] if length(lookup(prop, "policies", [])) > 0
  ]
}

resource "aws_iam_group_policy_attachment" "group_policies" {
  for_each = zipmap([for k, v in flatten(local.policy_groups) : k], flatten(local.policy_groups))

  group      = aws_iam_group.groups[each.value.group].name
  policy_arn = each.value.policy
}


/**
 * Create assume role policies for groups
 */

locals {
  // Create a list of group/role association in the format {group => [role1, role2]}] 
  assumable_groups = {
    for group, prop in var.groups :
    group => prop["assume_roles"] if length(lookup(prop, "assume_roles", [])) > 0
  }
}

resource "aws_iam_group_policy" "assume_role_policies" {
  for_each = local.assumable_groups

  name  = "AssumeRoles"
  group = aws_iam_group.groups[each.key].name

  policy = <<-EOF
  {
    "Version": "2012-10-17",
    "Statement": {
      "Effect": "Allow",
      "Action": "sts:AssumeRole",
      "Resource": [
        %{for index, role in each.value}
          "${role}"
          %{if(index != length(each.value) - 1)},%{endif}
        %{endfor}
      ]
    }
  }
  EOF
}
