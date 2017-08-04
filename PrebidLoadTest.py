from locust import HttpLocust, TaskSet, task

class MyTaskSet(TaskSet):
    @task
    def index(self):
        with client.post("/auction", catch_response=True) as response:
            if response.status_code == 200:
                response.success()
            else:
                response.failure("Wrong")

class MyLocust(HttpLocust):
    task_set = MyTaskSet
    min_wait = 5
    max_wait = 7