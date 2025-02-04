# Setup Kubernetes on Amazon EKS

You can follow same procedure in the official  AWS document [Getting started with Amazon EKS – eksctl](https://docs.aws.amazon.com/eks/latest/userguide/getting-started-eksctl.html)   

#### Pre-requisites: 
  - an EC2 Instance 
  - Install AWS-CLI latest verison 
  ```sh
  curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
  unzip awscliv2.zip
  ```


1. Setup kubectl   
   1.1 Download kubectl version 1.21  
   1.2 Grant execution permissions to kubectl executable   
   1.3 Move kubectl onto /usr/local/bin   
   1.4 Test that your kubectl installation was successful    

   ```sh 
   curl -o kubectl https://amazon-eks.s3.us-west-2.amazonaws.com/1.21.2/2021-07-05/bin/linux/amd64/kubectl
   chmod +x ./kubectl
   mv ./kubectl /usr/local/bin 
   kubectl version --short --client
   ```
2. Setup eksctl   
   2.1 Download and extract the latest release   
   2.2 Move the extracted binary to /usr/local/bin   
   2.3 Test that your eksclt installation was successful   

   ```sh
   curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
   sudo mv /tmp/eksctl /usr/local/bin
   eksctl version
   ```
  
3. Create an IAM Role and attache it to EC2 instance    
   `Note: create IAM user with programmatic access if your bootstrap system is outside of AWS`   
   IAM user should have access to   
   - IAM   
   - EC2   
   - CloudFormation  
   Note: Check eksctl documentaiton for [Minimum IAM policies](https://eksctl.io/usage/minimum-iam-policies/)
   
4. Create your cluster and nodes 
   ```sh
   eksctl create cluster --name cluster-name  \
   --region region-name \
   --node-type instance-type \
   --nodes-min 2 \
   --nodes-max 2 \ 
   --zones <AZ-1>,<AZ-2>
   
   example:
   eksctl create cluster --name Java-Cluster \
      --region ap-south-1 \
   --node-type t3.micro \
    ```

5. To delete the EKS clsuter 
   ```sh 
   eksctl delete cluster valaxy --region ap-south-1
   ```
   
6. Validate your cluster using by creating by checking nodes and by creating a pod 
   ```sh 
   kubectl get nodes
   kubectl run tomcat --image=tomcat 
   ```
   
   #### Deploying Nginx pods on Kubernetes for Testing
1. Deploying Nginx Container
    ```sh
    kubectl create deployment  demo-nginx --image=nginx --replicas=2 --port=80
    # kubectl deployment regapp --image=khaledmahmoud7/java-image:1.0 --replicas=2 --port=8080
    kubectl get all
    kubectl get pod
   ```

1. Expose the deployment as service. This will create an ELB in front of those 2 containers and allow us to publicly access them.
   ```sh
   kubectl expose deployment demo-nginx --port=80 --type=LoadBalancer
   # kubectl expose deployment regapp --port=8080 --type=LoadBalancer
   kubectl get services -o wide
   ```

