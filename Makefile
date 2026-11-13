.PHONY: init validate plan security-check

init:
      cd terraform && terraform init

validate:
      cd terraform && terraform validate

plan:
      cd terraform && terraform plan

security-check:
      checkov -d terraform --framework terraform