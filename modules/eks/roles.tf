resource "aws_iam_role" "eks-cluster-role" {
  name = "eks-cluster-role"

  assume_role_policy = <<EOF
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": [
            "eks.amazonaws.com"
        ]
      },
      "Action": [
        "sts:AssumeRole"
      ]
    }
  ],
  "Version": "2008-10-17"
}
  EOF
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSClusterPolicy" {
  role       = aws_iam_role.eks-cluster-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSServicePolicy" {
  role       = aws_iam_role.eks-cluster-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSServicePolicy"
}

resource "aws_iam_role_policy_attachment" "eks-AmazonEBSCSIDriverPolicy" {
  role       = aws_iam_role.eksdefaultspotBlueprintsEksClusterRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

resource "aws_iam_role_policy_attachment" "node-AmazonEKS_EBSCSI_Policy" {
  role       = aws_iam_role.eksdefaultspotBlueprintsNodeInstanceRole.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEBSCSIDriverPolicy"
}

resource "aws_iam_role" "eks-node-role" {
  name = "eks-node-role"

  assume_role_policy = <<EOF
{
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
          "Service": [
            "ec2.amazonaws.com"
          ]
      },
      "Action": [
          "sts:AssumeRole"
      ]
    }
  ],
  "Version": "2008-10-17"
}
  EOF

}

resource "aws_iam_role_policy_attachment" "example-AmazonEKSWorkerNodePolicy" {
  role       = aws_iam_role.eks-node-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSWorkerNodePolicy"
}

resource "aws_iam_role_policy_attachment" "example-AmazonEKS_CNI_Policy" {
  role       = aws_iam_role.eks-node-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEKS_CNI_Policy"
}

resource "aws_iam_role_policy_attachment" "example-AmazonEC2ContainerRegistryReadOnly" {
  role       = aws_iam_role.eks-node-role.name
  policy_arn = "arn:aws:iam::aws:policy/AmazonEC2ContainerRegistryReadOnly"
}