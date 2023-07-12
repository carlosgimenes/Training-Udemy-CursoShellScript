#!/bin/bash

maiuscula () {
     echo $1 | tr a-z A-Z
}

maiuscula $1