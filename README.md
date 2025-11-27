# Plant Shop Magento2
## Инфраструктура
TODO
## Установка
Раскатывается с нуля при помощи ansible:
1) Задать переменные 
```yaml
access_key: ACCESS_KEY_FROM_ADOBE
secret_key: SECRET_KEY_FROM_ADOBE
```
2) В `hosts` задать актуальный ip машины
3) В `ansible.cfg` задать путь к приватному ssh-ключу
4) Прокатать плейбук
```bash
ansible-playbook setup-m2.yaml
```
