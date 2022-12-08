resource "aws_eks_node_group" "node_group_1" {
  cluster_name    = aws_eks_cluster.spotblueprintscluster.name
  node_group_name = "eksdefaultNodeGroup1"
  node_role_arn   = aws_iam_role.eks-node-role.arn
  subnet_ids      = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id, aws_subnet.subnet_3.id]
  capacity_type   = "SPOT"
  instance_types  = var.instance_types

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}

resource "aws_eks_node_group" "node_group_2" {
  cluster_name    = aws_eks_cluster.spotblueprintscluster.name
  node_group_name = "eksdefaultNodeGroup2"
  node_role_arn   = aws_iam_role.eks-node-role.arn
  subnet_ids      = [aws_subnet.subnet_1.id, aws_subnet.subnet_2.id, aws_subnet.subnet_3.id]
  capacity_type   = "SPOT"
  instance_types  = ["t2.micro", "t2.medium"]

  scaling_config {
    desired_size = var.desired_size
    max_size     = var.max_size
    min_size     = var.min_size
  }

  depends_on = [
    aws_iam_role_policy_attachment.example-AmazonEKSWorkerNodePolicy,
    aws_iam_role_policy_attachment.example-AmazonEKS_CNI_Policy,
    aws_iam_role_policy_attachment.example-AmazonEC2ContainerRegistryReadOnly,
  ]
}