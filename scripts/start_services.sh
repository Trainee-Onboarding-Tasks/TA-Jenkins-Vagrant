#!/bin/bash
set -e


systemctl daemon-reexec 
systemctl daemon-reload 

systemctl enable jenkins docker
systemctl start jenkins
