from locust import HttpLocust, TaskSet, task

class MyTaskSet(TaskSet):
    @task
    def index(self):
        with self.client.post("/auction", catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure("Wrong")

    def scan_parcel(self):
        headers = {'content-type': 'application/json', 'dpdsession': '06784db0-784a-11e7-a1fa-85ad1b51d266', 'highlander': 'true', 'cache-control': 'no-cache', 'dpdclient': 'application/json'}
        payload = {"driverCode": "0056*FD8608", "labelNumber": "%0ML11XR15500748427135832826", "dateTime": "2017-08-03 03:00:41"}

        self.client.put("/depot/0056/route/796/?action=loadParcel", data=json.dumps(payload), headers=headers)


class MyLocust(HttpLocust):
    task_set = MyTaskSet
    min_wait = 5
    max_wait = 7