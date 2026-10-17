# IaC-project

Это простой проект, в рамках которого я создал несколько облачных серверов в reg.cloud при помощи Terraform.
Далее при помощи Ansible установил на каждый из них NGINX + Apache и настроил reverse proxy, установил Node Exporter на каждый сервер для сбора метрик. 
А потом для автоматизации рутины настроил CI/CD. 

Для визуализации метрик я установил на master облачном сервере Prometheus и Grafana. 

Playbook Ansible сработал корерктно:
<img width="2424" height="233" alt="изображение" src="https://github.com/user-attachments/assets/3b16f6e5-85df-4c21-a99e-54fc2959b0a8" />


<img width="2877" height="1728" alt="изображение" src="https://github.com/user-attachments/assets/818a210b-116b-45bc-aa3c-60d5269b1eb9" />

Prometheus корректно собирает метрики:
<img width="1920" height="679" alt="изображение" src="https://github.com/user-attachments/assets/10d27e88-853e-4caf-a822-c48cb800e111" />

А Grafana их визуализирует:
<img width="1920" height="888" alt="изображение" src="https://github.com/user-attachments/assets/b36775b0-49b9-4577-ae3f-409f2de2a35e" />
