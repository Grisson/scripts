
//
//  CA
//

// create a private root key, 4096 bit key, -aes256 password protected?
$ openssl genrsa -aes256 -out ca-key.pem 4096
 
// create a self signed certificate
$ openssl req -new -x509 -days 365 -key ca-key.pem -sha256 -out ca.pem

//
//  server cert
//

Create a server key and certificate signing request (CSR). Provide “Common Name” (CN) as server FQDN. This is the hostname you will use to connect to Docker:
// create a private key for server 
$ openssl genrsa -out server-key.pem 4096
 
 // create a certificate signing request
$ openssl req -subj "/CN=<dns name>" -sha256 -new -key server-key.pem -out server.csr
 
Next we will sign the public key with CA:
$ echo subjectAltName = IP:<private IP>,IP:127.0.0.1 > extfile.cnf

 // sign the certificate signing request
$ openssl x509 -req -days 365 -sha256 -in server.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out server-cert.pem -extfile extfile.cnf
 




Create a client key and certificate signing request for client authentication:
$ openssl genrsa -out key.pem 4096
 
$ openssl req -subj '/CN=client' -new -key key.pem -out client.csr
 
$ echo extendedKeyUsage = clientAuth > extfile.cnf
 
Now sign the public key
$ openssl x509 -req -days 365 -sha256 -in client.csr -CA ca.pem -CAkey ca-key.pem -CAcreateserial -out cert.pem -extfile extfile.cnf
 
Now  make the Docker daemon only accept connections from clients providing a certificate trusted by CA:
$ docker daemon --tlsverify --tlscacert=ca.pem --tlscert=server-cert.pem --tlskey=server-key.pem -H=0.0.0.0:2376
 
To be able to connect to Docker and validate its certificate, you need to provide your client keys, certificates and trusted CA:
$ docker --tlsverify --tlscacert=ca.pem --tlscert=cert.pem --tlskey=key.pem -H=dockervm1.cloudapp.net:2376 version
 
Move the files to the .docker directory in your home directory 
Use base64 for the keys
$ base64 ca.pem > ca64.pem
 
$ base64 server-cert.pem > server-cert64.pem
 
 
$ base64 server-key.pem > server-key64.pem


PEM is a base64 encoded DER certificate
DER is binary DER encoded certificates
FQDN: fully qualified domain name



https://support.ssl.com/Knowledgebase/Article/View/19/0/der-vs-crt-vs-cer-vs-pem-certificates-and-how-to-convert-them
https://blog.talpor.com/2015/07/ssltls-certificates-beginners-tutorial/

https://datacenteroverlords.com/2012/03/01/creating-your-own-ssl-certificate-authority/