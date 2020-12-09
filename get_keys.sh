apt install -y curl jq
for row in $(curl 'https://api.github.com/users/jvo5610/keys' | jq '.[] | .key')
    do
    echo $row | tr -d '"' | tr -d "\n" | sed 's/ssh-rsa/\nssh-rsa /g' >> ~/.ssh/authorized_keys
    done