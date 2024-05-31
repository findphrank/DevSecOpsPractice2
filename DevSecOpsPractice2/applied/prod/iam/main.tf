resource "aws_iam_user" "my_user" {
    for_each = local.new_staff
    name = each.key
}

resource "aws_iam_user_policy_attachment" "my_user" {
    for_each = local.new_staff
    user       = aws_iam_user.my_user[each.key].name
    policy_arn = each.value
}

resource "aws_iam_group" "my_groups" {
    for_each = local.managed_policies
    name = each.key
}

resource "aws_iam_group_policy_attachment" "my_groups_attachment" {
    for_each = local.managed_policies  
    group    = aws_iam_group.my_groups[each.key].name
    policy_arn = each.value
}

resource "aws_iam_group_policy" "group_inline" {
    for_each = local.inline_policies
    name  = "${each.key}-policy"
    group = aws_iam_group.my_groups[each.key].name
    policy = each.value
}
