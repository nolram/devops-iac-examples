import os

import boto3

import logging
import datetime

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)

region = os.getenv('SLS_AWS_REGION', 'us-east-1')
ec2 = boto3.client('ec2', region_name=region)


def stop_instance(event, context):
    instance_ids = []
    response = ec2.describe_instances(Filters=[{'Name': 'tag:StartStopInstance', 'Values': ["True"]}])
    instances_full_details = response['Reservations']
    for instance_detail in instances_full_details:
        group_instances = instance_detail['Instances']

        for instance in group_instances:
            instance_id = instance['InstanceId']
            instance_ids.append(instance_id)
    
    logger.info(f'Instance ids to stop: {instance_ids}')
    ec2.stop_instances(InstanceIds=instance_ids)
    return instance_ids


def start_instance(event, context):
    instance_ids = []
    response = ec2.describe_instances(Filters=[{'Name': 'tag:StartStopInstance', 'Values': ["True"]}])
    instances_full_details = response['Reservations']
    for instance_detail in instances_full_details:
        group_instances = instance_detail['Instances']

        for instance in group_instances:
            instance_id = instance['InstanceId']
            instance_ids.append(instance_id)
    
    logger.info(f'Instance ids to start: {instance_ids}')
    ec2.start_instances(InstanceIds=instance_ids)
    return instance_ids