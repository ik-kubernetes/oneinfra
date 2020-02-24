#!/usr/bin/env bash

# Copyright 2020 Rafael Fernández López <ereslibre@ereslibre.es>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

if [ -z "$CI" ]; then
    echo "This script is intended for CI. Install wireguard following the recommendations for your OS"
    exit 1
fi

if modinfo wireguard &> /dev/null; then
    echo "wireguard is installed"
    exit 0
fi

sudo add-apt-repository -y ppa:wireguard/wireguard
sudo apt-get update -qq
sudo apt-get install -qq -y linux-headers-$(uname -r) wireguard
