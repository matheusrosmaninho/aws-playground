module "infra_lambda_s3" {
  source = "github.com/matheusrosmaninho/terraform-modulos.git//modulo/aws/s3?ref=0.0.3"

  name = "terminalbaka-lambda-state"
}