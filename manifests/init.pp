define sshauthkeys ($keys) {
        $keys2=regsubst($keys,"\$","-$name")
        sshauthkeys::helper { $keys2: user => $name }
}
