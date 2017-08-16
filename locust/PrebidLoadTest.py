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
                    "tid": "abcd", 
                    "ad_units": [{ 
                        "code": "first", 
                        "sizes": [{ 
                            "w": 300, 
                            "h": 250 
                        }], 
                        "bids": [{ 
                            "bidder": "bing" ,
                            "params": {
                            "appId": "1234"
                            }
                        }, { 
                            "bidder": "appnexus" 
                        }] 
                    }, { 
                        "code": "second", 
                        "sizes": [{ 
                            "w": 728, 
                            "h": 90 
                        }], 
                        "bids": [{ 
                            "bidder": "indexExchange" 
                        }, { 
                            "bidder": "appnexus" 
                        }] 
                    }] 
                }
        
        with self.client.post("/auction", data=json.dumps(payload), headers=headers, catch_response=True) as response:
            #print response.content
            if response.status_code == 200:
                response.success()
            else:
                response.failure("Wrong")

class MyLocust(HttpLocust):
    task_set = MyTaskSet
    min_wait = 500 #5
    max_wait = 1000 #7