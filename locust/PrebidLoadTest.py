import json
from locust import HttpLocust, TaskSet, task

class MyTaskSet(TaskSet):
    @task
    def index(self):
        headers = {
                    "Host": "samplebidder3.azurewebsites.net",
                    "Connection": "keep-alive",
                    "Accept": "*/*",
                    "Origin": "http://www.msn.com",
                    "User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36",
                    "Content-Type": "text/plain;charset=UTF-8",
                    "Referer": "http://www.msn.com/en-us/?item=staticsmode:debug&item=bing_native_hp:true&xd=BBBI7Kt&na-requesttype=post&na-feedback=true&na-debug=true",
                    "Accept-Encoding": "gzip, deflate, br",
                    "Accept-Language": "en-US,en;q=0.8"
                }
        
        payload = {
                    "imp": [
                        {
                            "id": "b5adb39b-302d-4471-bece-19edfde07914"
                        }
                    ],
                    "site": {
                        "domain": "www.msn.com",
                        "cat": [
                            "homepage"
                        ],
                        "page": "http://www.msn.com/en-us/",
                        "keywords": [
                            "MSN.com - Hotmail, Outlook, Skype, Bing, Latest News, Photos & Videos"
                        ],
                        "publisher": {
                            "id": "1239585",
                            "name": "msn",
                            "ext": {
                                "apikey": "ARAF5kVAkFcXQk5pMJxz4aq/U8/DsGGEHy/Gj67FcQebinv/RwKLs6b9ZXpwvV8y4dw=",
                                "tracingtag": "infopane-1"
                            }
                        },
                        "content": {
                            "url": "http://www.msn.com/en-us/",
                            "title": "MSN.com - Hotmail, Outlook, Skype, Bing, Latest News, Photos & Videos",
                            "cat": [
                                "homepage"
                            ],
                            "keywords": [
                                "MSN.com - Hotmail, Outlook, Skype, Bing, Latest News, Photos & Videos"
                            ]
                        },
                        "ext": {
                            "pagetype": "<pagetype>"
                        }
                    }
                }
        
        with self.client.post("/auction", data=json.dumps(payload), headers=headers, catch_response=True) as response:
            print response.content
            if response.status_code == 200:
                response.success()
            else:
                response.failure("Wrong")

class MyLocust(HttpLocust):
    task_set = MyTaskSet
    min_wait = 300 #5
    max_wait = 500 #7