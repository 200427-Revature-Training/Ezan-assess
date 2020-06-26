function type(obj){
    return typeof(obj);
}

function multiply(num1,num2){//a
    return num1*num2;
}

function product(...args){//b
    return args.reduce(multiply(num1, num2));
}

function sum(int_array){//c
    let sum=0;
    for(let i = 0; i < int_array.length; i++){
        sum+=int_array[i];
     }
     return sum;
}

function raise(num){//d
    let sum=0;
    let exp=num.length;
    for(let i = 0; i < exp; i++){
        let digit = String(num).charAt(i);
        let digit_as_number = Number(digit);
        let addition=Math.pow(digit_as_number,exp)
        sum+=addition;
     }
     if(sum==num){return true;}
     else{return false;}
}