## Este arquivo Terraform cria um bucket versionado na AWS, utilizei para testar o funcionamento do versionamento no S3.

O recurso `"aws_s3_bucket"` é usado para criar um bucket versionado no Amazon S3.

o recurso `"aws_s3_bucket_public_access_block"` é usado para desabilitar a opção de "bloqueio acesso publico"

O recurso `"aws_s3_bucket_versioning"` é usado para habilitar o versionamento no bucket.

E por fim o recurso `"aws_s3_bucket_website_configuration"` é usado para configurar web site estático! 

Você pode utilizar os arquivos da pasta `s3_versioning_files` para testar o upload de versionamento de arquivos, subir o index.html estático para testar como está funcionando juntamente com as imagens winkie.jpg.

Certifique-se de fornecer as credenciais AWS corretas e de ter permissões adequadas para criar e gerenciar recursos S3.

Exemplo de uso:
1. Execute `terraform init` para inicializar o diretório Terraform.
2. Execute `terraform apply` para criar o bucket e realizar os testes.
3. Verifique no console da AWS se o bucket foi criado corretamente e se o objeto de teste foi versionado conforme o esperado.

Para limpar os recursos criados, execute `terraform destroy` após concluir os testes.

Documentação adicional:
- Guia do usuário do Amazon S3: https://docs.aws.amazon.com/AmazonS3/latest/userguide/Welcome.html
- Documentação do Terraform AWS Provider: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
