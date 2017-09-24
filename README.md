# Project: Detecting Denial of Service Attacks in the Cloud

In this project, an approach to protecting virtual machines (VMs) against denial of service (DoS) attacks in a cloud environment is proposed. An open source cloud computing platform (Eucalyptus) has been deployed, and experimentation was carried out on this setup. We investigate attacks emanating from one or more virtual machines (VMs) to another VM in a multi-tenancy cloud environment. Various types of DoS attacks are mounted on a webserver VM. To detect such attacks from a cloud provider's perspective, an intrusion detection system (IDS) is needed. In this research we propose and implement an IDS which incorporates a packet sniffer, feature extractor and a classifier as part of its design. We have experimented with the one-class support vector machines (SVM) algorithm for classification of the attacks. The dataset containing time-based traffic flow features is passed through the classifier to detect the attack traffic from legitimate traffic. The proposed IDS design shows promising results in being able to detect the ICMP Flood, Ping-of-Death, UDP Flood, TCP SYN Flood, TCP LAND and DNS Flood attacks with high classification accuracies.

# Dataset
No. Feature  Shortname	Feature description

f1	TCP_Count	Number of occurrence for an incoming IP w.r.t TCP
f2	Avg_TCP_Count	Average number of occurrence for an incoming IP  w.r.t TCP

f3	UDP_Count	Number of occurrence for an incoming IP w.r.t UDP

f4	Avg_UDP_Count	Average number of occurrence for an incoming IP w.r.t UDP

f5	ICMP_Count	Number of occurrence for an incoming IP w.r.t ICMP

f6	Avg_ICMP_Count	Average Number of occurrence for an incoming IP w.r.t ICMP

f7	Other_Count	Number of occurrence for an incoming IP with respect with to other protocols

f8	Avg_Other_Count	Average number of occurrence for an incoming IP with repect to other protocols

f9	TCP_Bytes_In	Bytes received per unique IP w.r.t TCP

f10	Avg_TCP_Bytes_In	Average bytes received per unique IP w.r.t TCP

f11	UDP_Bytes_In	Bytes received per unique IP w.r.t UDP

f12	Avg_UDP_Bytes_In	Average bytes received per unique IP w.r.t UDP

f13	ICMP_Bytes_In	Bytes received per unique IP w.r.t ICMP

f14	Avg_ICMP_Bytes_In	Average bytes received per unique IP w.r.t ICMP

f15	Other_Bytes_In	Bytes received per unique IP w.r.t other protocols

f16	Avg_Other_Bytes_In	Average bytes received per unique IP w.r.t other protocols

f17	TCP_Bytes_Out	Bytes sent to the incoming IP w.r.t TCP

f18	Avg_TCP_Bytes_Out	Average bytes sent to the incoming IP w.r.t TCP

f19	UDP_Bytes_Out	Bytes sent to the incoming IP w.r.t UDP

f20	Avg_UDP_Bytes_Out	Average bytes sent to the incoming IP w.r.t UDP

f21	ICMP_Bytes_Out	Bytes sent to the incoming IP w.r.t ICMP

f22	Avg_ICMP_Bytes_Out	Average bytes sent to the incoming IP w.r.t ICMP

f23	Other_Bytes_Out	Bytes sent to the incoming IP w.r.t other protocols

f24	Avg_Other_Bytes_Out	Average bytes sent to the incoming IP w.r.t to other protocols