from setuptools import setup, find_packages

setup(
    name='file_operations',
    version='1.0',
    packages=find_packages(),
    install_requires=[
        'pandas',
        'openpyxl'
    ]
)
