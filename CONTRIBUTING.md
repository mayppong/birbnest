# Contribution Guide


## Setup
If you prefer to develop in a virtual machine, birbnest is shipped with vagrant and virtualbox support. Simply run

```
vagrant up    # start the vm and provision
vagrant ssh   # ssh into the vm
```

Alternatively, you can create a docker container to work with birbnest as well by executing the following command

```
docker-compose run web bash
```


## Dependencies

```
mix deps.get
```


## Testing

```
mix test
```
