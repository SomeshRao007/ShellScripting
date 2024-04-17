# ShellScripting
You will find here 
> how, why, why and thats why!

**To run** 

./NAME_OF_FILE.sh

bash NAME_OF_FILE.sh

**Permissions**

chmod +x NAMAE_OF_FILE.sh

**The Hash-Bang Hack**

Scripts are also identified with a shebang. Shebang is a combination of bash # and bang !  followed the the bash shell path. This is the first line of the script. Shebang tells the shell to execute it via bash shell. Shebang is simply an absolute path to the bash interpreter.

#!/bin/bash

**New Line = New Command**

Every new line should be considered a new command, or a component of a larger system.

## Variables 

A variable name could contain any alphabet (a-z, A-Z), any digits (0-9), and an underscore ( _ ). However, a variable name must start with an alphabet or underscore. It can never start with a number.

We can define a variable by using the syntax 

``` variable_name=value ```

To get the value of the variable, add $ before the variable.

Example File: file link variable test

Numerical expressions can also be calculated and stored in a variable using:

``` var=$((expression)) ```

Fractions are not correctly calculated using the above methods and truncated.

For decimal calculations, we can use bc command to get the output to a particular number of decimal places. **bc** (Bash Calculator) is a command line calculator that supports calculation up to a certain number of decimal points.

~~ echo "scale=55;22/7" | bc ~~

![image](https://github.com/SomeshRao007/ShellScripting/assets/111784343/0e8a42cb-f0a2-4e3e-b5b5-c99110995a4e)


**Environment variables**

These variables are commonly used to configure the behavior script and programs that are run by shell. Environment variables are only created once, after which they can be used by any user.

`export PATH=/usr/local/bin:$PATH` would add `/usr/local/bin` to the beginning of the shell’s search path for executable programs.


## Read User Input 

In bash, we can take user input using the read command.

```read variable_name```

To prompt the user with a custom message, use the -p flag.

```read -p "Enter your age" variable_name```

Comparison is used to check if statements evaluate to true or false

![image](https://github.com/SomeshRao007/ShellScripting/assets/111784343/c1b512c0-6b0c-49f0-b9c7-225af9526bbc)

## Conditional Statements

Conditions are expressions that evaluate to a boolean expression (true or false). To check conditions, we can use if, if-else, if-elif-else and nested conditionals.

```
if [[ condition ]]
then
	statement
elif [[ condition ]]; then
	statement 
else
	do this by default
fi
```

To create meaningful comparisons, we can use AND -a and OR -o as well.

```if [ $a -gt 40 -a $b -lt 6 ]```

![image](https://github.com/SomeshRao007/ShellScripting/assets/111784343/9be84ad2-990c-4efb-b8ea-68e75b2e178c)

>> C variable helping you to set your imagination 😜

>BTW if creating multiple touch xzy.sh && touch sdy.sh then to make everything executable  

```chmod +x $PWD/*.sh```

## Looping and skipping
For loops allow you to execute statements a specific number of times.

While loops check for a condition and loop until the condition remains true. We need to provide a counter statement that increments the counter to control loop execution.

>> how to indentify an argument is IPv4 or IPv6 ??

```
  1 #!/bin/bash
  2 
  3 #string='1.1.1.1';
  4 read -p "enter IP" string
  5 if [[ $string =~ .*:.* ]]
  6 then
  7   printf "IPv6"
  8 else
  9   printf "IPv4"
 10 fi
```

yeah that's how we do it!!


## Switch Case

The switch case in shell scripts takes the variable as an argument and then checks the expression variable for a pattern match; a default case or condition will be used if no pattern match is found. 

I’m going to do is to create a script that will allow us to create a file or delete a file based on the argument that we pass to it. But since we cannot handle everything that someone might pass as an argument, we will use the asterisk (*) operator to catch any other argument passed to it and print an error message.


```
#!/bin/bash
case $1 in
        "--create")
                echo "Creating new file $2"
                echo
                touch $2
                ;;
        "--delete")
                echo "Deleting file $2"
                echo
                rm $2
                ;;
        *)
                echo "Not a valid argument"
                echo
                ;;
esac
```


![image](https://github.com/SomeshRao007/ShellScripting/assets/111784343/c463ae9c-54fa-4172-9a4e-3f0864ec5902)


## Functions

The basic syntax for defining a function is just the function name followed by round brackets. 

```
function_name(){
    code and variables to work with
}
```
Example: 

~~~
find_avg(){ 
  len=$#
  sum=0
  for x in "$@"
  do
     sum=$((sum + x))
  done
  avg=$((sum/len))
  return $avg
}
find_avg 30 40 50 60
printf "%f" "$?"
printf "\n"
~~~


**$# (Number of Arguments)**
>The **$# symbol** represents the number of arguments passed to a shell script or function. When you run a shell script with arguments, $# provides the count of those arguments.For example, if you execute a script like this:

```./myscript.sh arg1 arg2 arg3```

**The value of $# inside myscript.sh will be 3** indicating that there are three arguments.

**$@ (All Arguments)** 
>The **$@ symbol** represents all the arguments passed to a shell script or function as separate words. It treats each argument as an individual entity. For instance, if you use $@ within a loop, it will iterate over each argument. Here’s an example:

```
#!/bin/bash
for arg in "$@"; do
    echo "Argument: $arg"
done
```

If you run this script with ./print_args.sh arg1 arg2 arg3, it will print:

```
Argument: arg1
Argument: arg2
Argument: arg3
```

**Exit Status ($?)**
>After a command is executed, it returns an exit status (also known as a return status or exit code).This exit status is an integer value that indicates whether the command was successful or if an error occurred. **By convention, an exit status of 0** indicates success, while any non-zero value indicates an error. The $? variable holds the exit status of the last command executed.

~~~
For example:
grep "text" file.txt
echo $?
~~~

**If the grep command finds the text “text” in file.txt, it will return 0 and $? will be 0**. If it does not find the text, it will return a non-zero value, and $? will hold that value.
