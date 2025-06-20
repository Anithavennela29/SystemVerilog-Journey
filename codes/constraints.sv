 //Q1.Write a constraint to generate below pattern 0101010101...

class cons;
 rand int a[];
 constraint x{a.size==10;}
 constraint y{foreach(a[i])
 if(i%2==0)
 a[i]==0;
 else
 a[i]==1;}
 function void post_randomize();
 $display("Randomized data is %0p",a);
 endfunction
 endclass
 cons c;
 module top;
 initial
 begin
 endmodule
 c=new();
 assert(c.randomize());
 end
    Randomized data is 0 1 0 1 0 1 0 1 0 1


   //Q2:Write a constraint to generate below pattern 1234554321
 //ANS:
 class cons;
 rand int a[];
 constraint x{a.size==10;}
 constraint y{foreach(a[i])
 if(i<5)
 a[i]==i+1;
 else
 a[i]==10-i;}
 function void post_randomize();
 $display("Randomized data is %0p",a);
 endfunction
 endclass
 cons c;
 module top;
 initial
 begin
c=new();
 assert(c.randomize());
 end
 endmodule

    Randomized data is 1 2 3 4 5 5 4 3 2 1

//Q6:Write a code to generate random number between 1.35 and 2.57
 //ANS:
 class cons;
 rand int a;
 real b;
 constraint size{a inside {[1350:2570]};}
 function void post_randomize();
 b=a/1000.0;
 $display("Random number in between 1.35 and 2.57 is %0f",b);
 endfunction
 endclass
 cons c;
 module top;
 initial
 begin
 c=new()


   Random number in between 1.35 and 2.57 is 1.877000


 class cons;
 rand int even[];
 rand int odd[];
 //function for doing the factorial
 function int fact(int i);
 if(i==0)
 fact=1;
 else
 fact=i*fact(i-1);
 endfunction
 //constraint
 constraint size{even.size==5;}
 //for even numbers factorial
 constraint even_fact{foreach(even[j])
 even[j]==fact(2*(j+1));}
 //for odd numbers factorial
 constraint odd_fact{foreach(odd[k])
 odd[k]==fact((2*k)+1);}
 function void post_randomize();
 $display("Factorial of 1st five even numbers is %0p",even);
 //$display("Factorial of 1st five odd numbers is %0p",odd);
 endfunction
 endclass
 cons c;
 module test;
 initial
begin
 c=new;
 c.randomize;
 end
 endmodule
    Factorial of 1st five even numbers is 2 24 720 40320 3628800
