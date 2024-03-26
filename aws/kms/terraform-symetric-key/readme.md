## Criando uma chave simétrica simples e utilizando ela para encriptar o battleplans.txt e desencriptar.

Através do comando `terraform init`e `terraform apply` você pode criar uma KMS Key simétrica.

- Esse é só um teste simples de criptografia de arquivo.
- Você precisa configurar o main.tf com sua aws `access_key` e `secret_key`.
- Você precisar mudar a policy para o seu `iam user`

### Comando para encriptar o arquivo battleplans.txt
`aws kms encrypt 
    --key-id alias/catrobot 
    --plaintext fileb://battleplans.txt 
    --output text 
    --query CiphertextBlob 
    | base64 --decode > not_battleplans.enc `

### Comando para desencriptar o arquivo battleplans.

`aws kms decrypt 
    --ciphertext-blob fileb://not_battleplans.enc 
    --output text 
    --query Plaintext | base64 --decode > decryptedplans.txt`