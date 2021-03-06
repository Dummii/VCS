#property copyright "Copyright ©2020, R. Worapat"
#property link      "worapat.rst@gmail.com"
#property version   "2.01"
//+------------------------------------------------------------------+
#include <MyObjects\Arrays\List.mqh>
#include <MyObjects\Arrow.mqh>

class MyCListArrow
  {
private:
   CList*            ListArrow;
public:
                     MyCListArrow();
                    ~MyCListArrow();

   void              Insert();
   void              Insert(double Price, datetime Times);
   void              Insert(double Price, datetime Times, 
                            ENUM_OBJECT Type);
   bool              Insert(string Name, string Tip, double Price, 
                             datetime Times, ENUM_OBJECT Type);

   bool              SetAtIndexName(int ind, string NewName);
   bool              SetAtNameOfName(string Name, string NewName);
   bool              SetAtIndexTip(int ind, string NewTip);
   bool              SetAtNameOfTip(string Name, string NewTip);
   bool              SetAtIndexPrice(int ind, double NewPrice);
   bool              SetAtNameOfPrice(string Name, double NewPrice);
   bool              SetAtIndexTime(int ind, datetime NewTime);
   bool              SetAtNameOfTime(string Name, datetime NewTime);
   bool              SetAtIndexType(int ind, ENUM_OBJECT NewType);
   bool              SetAtNameOfType(string Name, ENUM_OBJECT NewType);
   bool              SetAtIndexCode(int ind, int NewCode);
   bool              SetAtNameOfCode(string Name, int NewCode);
   bool              SetAtIndexColor(int ind, color NewColor);
   bool              SetAtNameOfColor(string Name, color NewColor);
   bool              SetAtIndexAnchor(int ind, ENUM_ARROW_ANCHOR ArrowAnchor);
   bool              SetAtNameOfAnchor(string Name, ENUM_ARROW_ANCHOR ArrowAnchor);

   int               GetSize();
   string            GetLastArrowName();
   string            GetAtIndexName(int ind);
   int               GetAtNameOfIndex(string Name);
   string            GetAtIndexTip(int ind);
   string            GetAtNameOfTip(string Name);
   double            GetAtIndexPrice(int ind);
   double            GetAtNameOfPrice(string Name);
   datetime          GetAtIndexTime(int ind);
   datetime          GetAtNameOfTime(string Name);
   ENUM_OBJECT       GetAtIndexType(int ind);
   ENUM_OBJECT       GetAtNameOfType(string Name);
   int               GetAtIndexCode(int ind);
   int               GetAtNameOfCode(string Name);
   color             GetAtIndexColor(int ind);
   color             GetAtNameOfColor(string Name);
   ENUM_ARROW_ANCHOR GetAtIndexAnchor(int ind);
   ENUM_ARROW_ANCHOR GetAtNameOfAnchor(string Name);

   void              ClearAll();
   bool              DeletAtIndex(int ind);
   bool              DeletAtName(string Name);

private:
   bool              FindName(string Name);
   int               iFindName(string Name);
  };
//+------------------------------------------------------------------+
MyCListArrow::MyCListArrow()
  {
   ListArrow = new CList;
   ListArrow.FreeMode(true);
  }
//+------------------------------------------------------------------+

MyCListArrow::~MyCListArrow()
  {
   //---
   if(ListArrow.Total()>0)
     {
      ListArrow.Clear();
     }
   //---
   delete ListArrow;
  }
//+------------------------------------------------------------------+

int MyCListArrow::GetSize(void)
  {
   return(ListArrow.Total());
  }
//+------------------------------------------------------------------+

bool MyCListArrow::Insert(string Name,string Tip,double Price,datetime Times,ENUM_OBJECT Type)
  {

   MyCArrow* NewArrow;

   if(ListArrow.Total()>0)
     {
      if(this.FindName(Name)) return(false);
     }
   //---
   NewArrow = new MyCArrow(Name,Tip,Price,Times,Type);
   ListArrow.Add(NewArrow);
   //---
   return(true);
  }
//+------------------------------------------------------------------+
void MyCListArrow::Insert(double Price,datetime Times,ENUM_OBJECT Type)
  {

   MyCArrow* NewArrow;
   //---
   NewArrow = new MyCArrow(Price,Times,Type);
   ListArrow.Add(NewArrow);
  }
//+------------------------------------------------------------------+
void MyCListArrow::Insert(double Price,datetime Times)
  {
   MyCArrow* NewArrow;
   //---
   NewArrow = new MyCArrow(Price,Times);
   ListArrow.Add(NewArrow);
  }
//+------------------------------------------------------------------+
void MyCListArrow::Insert()
  {

   MyCArrow* NewArrow;
   //---
   NewArrow = new MyCArrow();
   ListArrow.Add(NewArrow);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtNameOfColor(string Name,color NewColor)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.SetAtIndexColor(ind, NewColor));
        }
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtIndexColor(int ind,color NewColor)
  {

   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.SetColor(NewColor));
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtIndexCode(int ind,int NewCode)
  {

   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.SetCode(NewCode));
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtNameOfCode(string Name,int NewCode)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.SetAtIndexCode(ind, NewCode));
        }
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtIndexName(int ind,string NewName)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.SetName(NewName));
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtNameOfName(string Name,string NewName)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.SetAtIndexName(ind, NewName));
        }
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtIndexTip(int ind,string NewTip)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.SetTip(NewTip));
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtNameOfTip(string Name,string NewTip)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.SetAtIndexTip(ind, NewTip));
        }
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtIndexPrice(int ind,double NewPrice)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.SetPrice(NewPrice));
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+
bool MyCListArrow::SetAtNameOfPrice(string Name,double NewPrice)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.SetAtIndexPrice(ind, NewPrice));
        }
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+
bool MyCListArrow::SetAtIndexTime(int ind,datetime NewTime)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.SetTime(NewTime));
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtNameOfTime(string Name,datetime NewTime)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.SetAtIndexTime(ind, NewTime));
        }
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+

bool MyCListArrow::SetAtIndexType(int ind,ENUM_OBJECT NewType)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.SetType(NewType));
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+
bool MyCListArrow::SetAtNameOfType(string Name,ENUM_OBJECT NewType)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.SetAtIndexType(ind, NewType));
        }
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+
bool MyCListArrow::SetAtIndexAnchor(int ind,ENUM_ARROW_ANCHOR ArrowAnchor)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.SetAnchor(ArrowAnchor));
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+
bool MyCListArrow::SetAtNameOfAnchor(string Name,ENUM_ARROW_ANCHOR ArrowAnchor)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.SetAtIndexAnchor(ind, ArrowAnchor));
        }
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+
string MyCListArrow::GetAtIndexName(int ind)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.GetName());
     }
   //---
   return(NULL);
  }
//+------------------------------------------------------------------+

string MyCListArrow::GetLastArrowName(void)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>0)
     {
      //---
      NewArrow = ListArrow.GetLastNode();
      //---
      return(NewArrow.GetName());
     }
   //---
   return(NULL);
  }
//+------------------------------------------------------------------+
color MyCListArrow::GetAtIndexColor(int ind)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.GetColor());
     }
   //--- Îøèáêà òèïà
   return(NULL);
  }
//+------------------------------------------------------------------+
color MyCListArrow::GetAtNameOfColor(string Name)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.GetAtIndexColor(ind));
        }
     }
   //---Error
   return(NULL);
  }
//+------------------------------------------------------------------+
int MyCListArrow::GetAtIndexCode(int ind)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.GetCode());
     }
   return(-1);
  }
//+------------------------------------------------------------------+
int MyCListArrow::GetAtNameOfCode(string Name)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.GetAtIndexCode(ind));
        }
     }
   //---Error
   return(-1);
  }
//+------------------------------------------------------------------+
int MyCListArrow::GetAtNameOfIndex(string Name)
  {
   return(this.iFindName(Name));
  }
//+------------------------------------------------------------------+
string MyCListArrow::GetAtIndexTip(int ind)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.GetTip());
     }
   //---
   return(NULL);
  }
//+------------------------------------------------------------------+
string MyCListArrow::GetAtNameOfTip(string Name)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.GetAtIndexTip(ind));
        }
     }
   //---
   return(NULL);
  }
//+------------------------------------------------------------------+
double MyCListArrow::GetAtIndexPrice(int ind)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.GetPrice());
     }
   //---
   return(-1.0);
  }
//+------------------------------------------------------------------+
double MyCListArrow::GetAtNameOfPrice(string Name)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.GetAtIndexPrice(ind));
        }
     }
   //---
   return(-1.0);
  }
//+------------------------------------------------------------------+
datetime MyCListArrow::GetAtIndexTime(int ind)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.GetTime());
     }
   //---
   return(NULL);
  }
//+------------------------------------------------------------------+
datetime MyCListArrow::GetAtNameOfTime(string Name)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.GetAtIndexTime(ind));
        }
     }
   //---
   return(NULL);
  }
//+------------------------------------------------------------------+
ENUM_OBJECT MyCListArrow::GetAtIndexType(int ind)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.GetType());
     }
   //---
   return(NULL);
  }
//+------------------------------------------------------------------+
ENUM_OBJECT MyCListArrow::GetAtNameOfType(string Name)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.GetAtIndexType(ind));
        }
     }
   //---
   return(NULL);
  }
//+------------------------------------------------------------------+
ENUM_ARROW_ANCHOR MyCListArrow::GetAtIndexAnchor(int ind)
  {
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>ind)
     {
      //---
      NewArrow = ListArrow.GetNodeAtIndex(ind);
      //---
      return(NewArrow.GetAnchor());
     }
   //---
   return(NULL);
  }
//+------------------------------------------------------------------+
ENUM_ARROW_ANCHOR MyCListArrow::GetAtNameOfAnchor(string Name)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.GetAtIndexAnchor(ind));
        }
     }
   //---
   return(NULL);
  }
//+------------------------------------------------------------------+
bool MyCListArrow::FindName(string Name)
  {
   int ind = 0;
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>0)
     {
      while(ind<ListArrow.Total())
        {
         NewArrow = ListArrow.GetNodeAtIndex(ind);
         if(Name == NewArrow.GetName())
           {
            return(true);
           }
         ind++;
        }
     }
   return(false);
  }
//+------------------------------------------------------------------+
int MyCListArrow::iFindName(string Name)
  {
   //---
   int ind = 0;
   int ret = -1;
   MyCArrow* NewArrow;
   //--- 
   if(ListArrow.Total()>0)
     {
      while(ind<ListArrow.Total())
        {
         NewArrow = ListArrow.GetNodeAtIndex(ind);
         if(Name == NewArrow.GetName())
           {
            ret = ind;
            break;
           }
         ind++;
        }
     }
   return(ret);
  }
//+------------------------------------------------------------------+
void MyCListArrow::ClearAll(void)
  {
   //---
   if(ListArrow.Total()>0)
     {
      ListArrow.Clear();
     }
  }
//+------------------------------------------------------------------+
bool MyCListArrow::DeletAtIndex(int ind)
  {
   //---
   if(ListArrow.Total()>ind)
     {
      return(ListArrow.Delete(ind));
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+
bool MyCListArrow::DeletAtName(string Name)
  {
   //---
   if(ListArrow.Total()>0)
     {
      int ind = this.iFindName(Name);
      //---
      if(ind>-1)
        {
         return(this.DeletAtIndex(ind));
        }
     }
   //---
   return(false);
  }
//+------------------------------------------------------------------+