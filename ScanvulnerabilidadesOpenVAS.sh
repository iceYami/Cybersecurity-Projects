sudo apt-get update
sudo apt-get install openvas
sudo greenbone-nvt-sync
sudo greenbone-scapdata-sync
sudo greenbone-certdata-syncsudo systemctl start openvas-scanner
sudo systemctl start openvas-manager
sudo systemctl start openvas-gsa
sudo openvasmd --create-user=admin --role=Admin
sudo omp -u admin -w <password> --get-targets
sudo omp -u admin -w <password> --xml='<create_task><name>Escaneo de ejemplo</name><target>192.168.1.1</target></create_task>' -T
sudo omp -u admin -w <password> --start-task=<task_id>
sudo omp -u admin -w <password> --get-task <task_id>
sudo omp -u admin -w <password> --get-tasks
sudo omp -u admin -w <password> --xml='<get_reports report_id="task_id" format_id="c1645568-627a-11e3-a660-406186ea4fc5"/>' -R <task_id>

# <password> = password de admin
# <task_id> = ID del escaneo
