# 🛠️ Terraform Infrastructure Testing with Terratest, GitHub Actions & LocalStack 🚀

This project is a complete setup for testing and validating **Terraform Infrastructure-as-Code (IaC)** using:

- ✅ **Terratest** for integration tests
- ⚙️ **GitHub Actions** for CI/CD
- 🧊 **LocalStack** for local AWS emulation

It ensures that your cloud infrastructure changes are linted, formatted, validated, and tested — before being applied!

---

## 📖 What is Terratest?

**Terratest** is an open-source Go library from [Gruntwork](https://gruntwork.io/) that lets you:

- Write **automated tests** for your **infrastructure code**
- Execute real **Terraform** commands (`init`, `apply`, `destroy`) in tests
- Validate resources by interacting with cloud APIs (e.g., using AWS SDK)
- Clean up infrastructure after tests run (via `defer terraform.Destroy`)

> Think of Terratest as **unit + integration testing** for your Terraform modules — so you never deploy broken infrastructure again.

---

## 📁 Project Structure

```bash
my-terraform-project/
├── .github/
│   └── workflows/
│       ├── terraform.yml         # Main CI/CD pipeline
│       └── localstack.yml        # Reusable workflow to setup LocalStack
├── terraform/
│   ├── main.tf
│   ├── variables.tf
│   ├── outputs.tf
│   └── backend.tf
└── test/
    └── integration/
        ├── main_test.go          # Terratest integration tests
        ├── go.mod
        └── go.sum
