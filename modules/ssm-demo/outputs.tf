output "arn" {
  description = "ARN of the created SSM parameter."
  value       = aws_ssm_parameter.this.arn
}
