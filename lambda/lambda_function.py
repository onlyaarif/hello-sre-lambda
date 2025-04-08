def handler(event, context):
    return {
        "status": "200",
        "statusDescription": "OK",
        "headers": {
            "content-type": [{
                "key": "Content-Type",
                "value": "text/html; charset=utf-8"
            }]
        },
        "body": "<h1>✅ Hello from Arif's Lambda@Edge function!</h1>",
        "bodyEncoding": "text"
    }