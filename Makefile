  
all: build

build:
	@docker build --tag=dockermax83/squid-ldap ubuntu-squid/.
