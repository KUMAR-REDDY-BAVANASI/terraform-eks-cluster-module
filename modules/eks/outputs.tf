output "endpoint" {
  value = aws_eks_cluster.spotblueprintscluster.endpoint
}

output "kubeconfig-certificate-authority-data" {
  value = aws_eks_cluster.spotblueprintscluster.certificate_authority[0].data
}