#include <vector>
#include <iostream>
using namespace std;
template <typename T>
class Matrix
{
    private:
    vector<vector<T>> v;
    int r,c;

    public:
    Matrix(){
        r=0;
        c=0;
    }
    Matrix(int r, int c){
        this->r=r;
        this->c=c;
        v.resize(r,vector<T>(c));
    }
    void readm(){
        cout<<"Matrix size: ";
        cin>>r>>c;
        v.resize(r,vector<T>(c));
        cout<<"Matrix elements: ";
        for (int i=0; i<r; i++){
            for (int f=0; f<c; f++){
                cin>>v[i][f];
            }
        }

    }
    int k=0;
    void printm(){
        for (int i=0; i<r;i++){
            for (int f=0; f<c; f++){
                k+=1;
                if (k%c==0){
                    cout<<v[i][f]<<" ";
                    cout<<endl;
                }
                else {
                    cout<<v[i][f]<<" ";
                }
            }
        }
    }
    Matrix operator+(const Matrix & other){
        if (r!=other.r || c!=other.c){
            throw invalid_argument("dimensions dont match");
        }
        Matrix res(r,c);
        for (int i=0;i<r;i++){
            for(int f=0;f<c;f++){
                res.v[i][f]=v[i][f]+other.v[i][f];
            }
        }
        return res;
    }
    Matrix operator-(const Matrix & other){
        if (r!=other.r || c!=other.c){
            throw invalid_argument("dimensions don't match");
        }
        Matrix res(r,c);
        for (int i=0;i<r;i++){
            for(int f=0;f<c;f++){
                res.v[i][f]=v[i][f]-other.v[i][f];
            }
        }
        return res;
    }
    Matrix operator*(const Matrix & other){
        if (c!=other.r){
            throw invalid_argument("number of columns doesn't match the number of rows");
        }
        Matrix res(r,other.c);
        for (int i=0;i<r;i++){
            for (int f=0;f<other.c;f++){
                for(int n=0;n<c;n++){
                    res.v[i][f]+=v[i][n]*other.v[n][f];
                }
            }
        }
        return res;
    }
    Matrix& operator=(const Matrix & other){
        r=other.r;
        c=other.c;
        v=other.v;
        return *this;
    }
    static Matrix idm(int s){
        Matrix<T> id(s,s);
        for (int i=0;i<s;i++){
            id.v[i][i]=1;
        }
        return id;
    }
    static Matrix zerom(int nr, int nc){
        Matrix<T> zero(nr,nc);
        for (int i=0;i<nr;i++){
            for (int f=0;f<nc;f++){
                zero.v[i][f]=0;
            }
        }
        return zero;
    }
};
