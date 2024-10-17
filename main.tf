# Test LLabs - Windson Santana 
# How to execute
# Step 1: Validar keybase. Essa base foi criada com infos pessoais. Para testes ira funcionar normalmente.
# Step 2: Para user de servico, alterar o campo create_access_keys para true.
# Comando descriptografia utilizando o proprio terminal git.
# Run command on bash "gpg --batch --gen-key key-gen-template"

module "iam_groups" {
  source = "./modules/iam-groups"

  groups = {

    G-LlabsAdminUsersAws = {
      policies = ["arn:aws:iam::aws:policy/AdministratorAccess"]
    }

    G-LlabsReadonlyUsersAws = {
      policies = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
    }

    G-AppsReadOnlyMultilogica = {
      policies = ["arn:aws:iam::aws:policy/ReadOnlyAccess"]
    }
  }
}

output "iam_groups" {
  value = module.iam_groups.groups
}

module "iam_users" {
  source = "./modules/iam-users"

  force_destroy         = true
  create_access_keys    = true
  create_login_profiles = true
  pgp_key               = "keybase:srvcgoodtecprd" # Usuário de servico da chave privada

  users_groups = {
    "gude.santana"    = ["G-LlabsReadonlyUsersAws", "G-LlabsAdminUsersAws"]
    "Jorge.back"      = ["G-LlabsReadonlyUsersAws", "G-LlabsAdminUsersAws"]
    "Joao.silveira"   = ["G-LlabsReadonlyUsersAws"]
    "app.frontend"    = ["G-LlabsAdminUsersAws"]
    "app.backend"     = ["G-LlabsAdminUsersAws"]
  }

  tags = {

    Org         = "Llabs"
    Environment = "Prd"
    TypeUser    = "Console"
  }

  module_depends_on = [module.iam_groups.groups]
}

output "iam_users" {
  value = module.iam_users.users
}