import boto3

dynamodb = boto3.resource("dynamodb", endpoint_url="http://localhost:8000")
tablename = "test-data-table-dev"


def setup():
    dynamodb.create_table(
        TableName=tablename,
        KeySchema=[
            {"AttributeName": "pk", "KeyType": "HASH"},
            {"AttributeName": "sk", "KeyType": "RANGE"},
        ],
        AttributeDefinitions=[
            {"AttributeName": "pk", "AttributeType": "S"},
            {"AttributeName": "sk", "AttributeType": "S"},
            {"AttributeName": "data", "AttributeType": "S"},
        ],
        GlobalSecondaryIndexes=[
            {
                "IndexName": "gsi_1",
                "KeySchema": [
                    {"AttributeName": "sk", "KeyType": "HASH"},
                    {"AttributeName": "data", "KeyType": "RANGE"},
                ],
                "Projection": {"ProjectionType": "ALL"},
            },
        ],
        BillingMode="PAY_PER_REQUEST",
    )


if __name__ == "__main__":
    setup()
