function [fun,dfun] = f(x,y)
    fun=(1-2*x)*y;
    dfun=(1-2*x);
end