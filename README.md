
## Terraform Backend

Terraform을 사용하여 인프라스트럭처를 관리할 때, Terraform의 상태 파일(backend)을 보관하는 AWS 계정과 실제 인프라스트럭처 리소스가 프로비저닝되는 AWS 계정을 분리하는 것은 일반적인 보안 및 관리 관행입니다.
이 접근 방식은 Terraform 상태 파일의 보안을 강화하고, 팀 간의 접근 권한을 분리하며, 여러 프로젝트 또는 환경 간의 충돌을 방지하는 데 도움이 됩니다.
아래는 Terraform의 백엔드와 리소스 프로비저닝을 다른 AWS 계정에서 관리하는 방법에 대한 개요입니다.





```
+------------------+----------------+
| AWS Account Name | AWS Account ID |
+------------------+----------------+
| Shared           |   111111111111 |
| Dev              |   222222222222 |
| Qa               |   333333333333 |
| Prod             |   444444444444 |
| Test             |   555555555555 |
+------------------+----------------+

```