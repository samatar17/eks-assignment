My AWS EKS & Kubernetes Assignment.
 My Experience
This was definitely the hardest assignment I've done throughout my DevOps journey.
After completing AWS, Docker, Terraform and CI/CD assignments, I thought Kubernetes would be easier. I was completely wrong! 
I spent hours troubleshooting errors, fixing configurations and trying to understand why things weren't working. Every time I fixed one issue, another seemed to appear.
There were moments when I felt like I was going in circles, but I kept pushing because I wanted to understand what I was doing.
 What I Built
During this assignment, I worked with:
•	Terraform — Provisioning AWS infrastructure.
•	Amazon EKS — Deploying a Kubernetes cluster.
•	Kubernetes — Managing Pods, Deployments and Services.
•	Helm — Installing Kubernetes applications.
•	NGINX Ingress — Routing application traffic.
•	AWS Load Balancer — Exposing my application.
•	ExternalDNS & Route 53 — Automating DNS records.
•	cert-manager — Configuring SSL certificates.
•	AWS IAM — Managing permissions.

 Challenges I Faced and How I Fixed Them
1. IAM AccessDenied Errors 
ExternalDNS kept showing AccessDenied errors when trying to update Route 53.
After hours of troubleshooting, I discovered problems with the IAM permissions and role configuration.
I corrected the permissions, checked the logs and finally saw that four DNS records had been successfully updated! 
That was a big achievement after struggling with the same error for so long.
2. Kubernetes and DNS Configuration 
Understanding how Pods, Services, Ingress, Load Balancers and DNS worked together was challenging.
I checked each resource using kubectl, fixed configuration problems and eventually got my application running with a healthy Pod.
I also successfully connected ExternalDNS to Route 53.
3. SSL Certificate Problems 
This was probably the most frustrating part!
My application was running, DNS was working, but the SSL certificate kept showing READY: False.
After investigating, I discovered that NGINX was redirecting HTTP requests to HTTPS and interfering with Let's Encrypt verification.
I also learned that different NGINX Ingress controllers use different configuration settings.

What I Learned
This assignment taught me:
•	How Terraform and EKS work together.
•	How Kubernetes manages containerised applications.
•	How Helm and NGINX Ingress work.
•	How AWS IAM permissions affect Kubernetes services.
•	How ExternalDNS and Route 53 automate DNS.
•	How SSL certificates and Let's Encrypt verification work.
•	How to investigate errors using logs instead of guessing.
Most importantly, I learned that troubleshooting is one of the biggest parts of being a DevOps Engineer.
 Final Thoughts
This assignment tested my patience more than any other assignment I've completed.
I spent hours fixing errors, sometimes repeating the same commands and wondering whether I would ever finish.
But I'm proud that I successfully deployed my EKS cluster, got my application running and resolved the AWS permissions and DNS problems.
It wasn't easy, but I learned more from the difficulties than I would have if everything had worked the first time.
Every challenge is helping me become a better DevOps Engineer. 
