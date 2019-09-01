#!/bin/bash
echo "Updating Brew, this will take some time"
brew update

brew install openssl
brew install jq
brew install ruby
brew install libxml2
brew install python
brew install python@2
brew install zlib
brew install rename
brew install ldns
brew install xargs
pip3 install dnspython

#create a tools folder in ~/
mkdir ~/tools
cd ~/tools/

echo "installing bash_profile aliases from recon_profile"
git clone https://github.com/nahamsec/recon_profile.git
cd recon_profile
cat bash_profile >> ~/.zshrc
source ~/.zshrc
cd ~/tools/
echo "done"



#install go
if [[ -z "$GOPATH" ]];then
echo "It looks like go is not installed, would you like to install it now"
PS3="Please select an option : "
choices=("yes" "no" )
select choice in "${choices[@]}"; do
        case $choice in
                yes)

					echo "Installing Golang"
          brew install golang
					export GOROOT=/usr/local/opt/go/libexec
					export GOPATH=$HOME/go-workspace
					export PATH=$PATH:$GOPATH/bin:$GOROOT/bin
					echo 'export GOROOT=/usr/local/opt/go/libexec' >> ~/.zshrc
					echo 'export GOPATH=$HOME/go'	>> ~/.zshrc
					echo 'export PATH=$GOPATH/bin:$GOROOT/bin:$PATH' >> ~/.zshrc
					source ~/.zshrc
					sleep 1
					break
					;;
				no)
					echo "Please install go and rerun this script"
					echo "Aborting installation..."
					exit 1
					;;
	esac
done
fi


#Don't forget to set up AWS credentials!
echo "Don't forget to set up AWS credentials!"
brew install awscli
echo "Don't forget to set up AWS credentials!"

#install aquatone
echo "Installing Aquatone"
go get github.com/michenriksen/aquatone
echo "done"

#install chromium
echo "Installing Chromium"
brew cask install chromium
echo "done"

echo "installing JSParser"
git clone https://github.com/nahamsec/JSParser.git
cd JSParser*
sudo python setup.py install
cd ~/tools/
echo "done"

echo "installing Sublist3r"
git clone https://github.com/aboul3la/Sublist3r.git
cd Sublist3r*
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing teh_s3_bucketeers"
git clone https://github.com/tomdev/teh_s3_bucketeers.git
cd ~/tools/
echo "done"

echo "installing wpscan"
git clone https://github.com/wpscanteam/wpscan.git
cd wpscan*
sudo gem install bundler && bundle install --without test
cd ~/tools/
echo "done"

echo "installing dirsearch"
git clone https://github.com/maurosoria/dirsearch.git
cd ~/tools/
echo "done"

echo "installing lazys3"
git clone https://github.com/nahamsec/lazys3.git
cd ~/tools/
echo "done"

echo "installing virtual host discovery"
git clone https://github.com/jobertabma/virtual-host-discovery.git
cd ~/tools/
echo "done"

echo "installing sqlmap"
git clone --depth 1 https://github.com/sqlmapproject/sqlmap.git sqlmap-dev
cd ~/tools/
echo "done"

echo "installing knock.py"
git clone https://github.com/guelfoweb/knock.git
cd ~/tools/
echo "done"

echo "installing lazyrecon"
git clone https://github.com/nahamsec/lazyrecon.git
cd ~/tools/
echo "done"

echo "installing nmap"
brew install nmap
echo "done"

echo "installing massdns"
git clone https://github.com/blechschmidt/massdns.git
cd ~/tools/massdns
make
cd ~/tools/
echo "done"

echo "installing asnlookup"
git clone https://github.com/yassineaboukir/asnlookup.git
cd ~/tools/asnlookup
pip install -r requirements.txt
cd ~/tools/
echo "done"

echo "installing httprobe"
go get -u github.com/tomnomnom/httprobe
echo "done"

echo "installing unfurl"
go get -u github.com/tomnomnom/unfurl
echo "done"

echo "installing waybackurls"
go get github.com/tomnomnom/waybackurls
echo "done"

echo "downloading Seclists"
cd ~/tools/
git clone https://github.com/danielmiessler/SecLists.git
cd ~/tools/SecLists/Discovery/DNS/
##THIS FILE BREAKS MASSDNS AND NEEDS TO BE CLEANED
cat dns-Jhaddix.txt | head -n -14 > clean-jhaddix-dns.txt
cd ~/tools/
echo "done"



echo -e "\n\n\n\n\n\n\n\n\n\n\nDone! All tools are set up in ~/tools"
ls -la
echo "One last time: don't forget to set up AWS credentials in ~/.aws/!"
