# Linux create swap space automated script
The title says it all. Automatically configure swap and set it on bot

## Getting Started

Made for Linux distributions that support swap using fallocate.

### How to

Fire up terminal / SSH console and run :
```
wget https://raw.githubusercontent.com/jonathanhuihaolaw/linux-quickswapspace/master/create-swap.sh && sudo bash create-swap.sh
```
You can verify if the swap took place with :
```
free -h
```
