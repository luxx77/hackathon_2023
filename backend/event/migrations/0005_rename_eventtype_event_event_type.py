# Generated by Django 4.2 on 2023-04-30 09:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('event', '0004_event_location'),
    ]

    operations = [
        migrations.RenameField(
            model_name='event',
            old_name='eventtype',
            new_name='event_type',
        ),
    ]