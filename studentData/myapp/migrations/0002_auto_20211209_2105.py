# Generated by Django 3.1.5 on 2021-12-09 15:35

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('myapp', '0001_initial'),
    ]

    operations = [
        migrations.AlterUniqueTogether(
            name='studentdata',
            unique_together={('first_name', 'last_name')},
        ),
    ]
