#property copyright "Copyright ©2020, R. Worapat"
#property link      "worapat.rst@gmail.com"
#property version   "2.01"
//+------------------------------------------------------------------+
#include <MyObjects\Arrays\ListArrow.mqh>
#include <MyObjects\Arrays\ListTrendLine.mqh>
#include <MyObjects\Arrays\ListHLine.mqh>
//+------------------------------------------------------------------+

class MyCListPattern
  {
private:

   color             ColorArrow;
   color             ColorTrend;
   ENUM_LINE_STYLE   StyleTrend;
   int               WidthTrend;
   bool              BackTrend;
   ENUM_LINE_STYLE   StyleHLine;
   color             ColorUpHLine;       
   color             ColorDownHLine;
   int               WidthHLine;
   bool              BackHLine;
   MyCListArrow*     ListArrow;
   MyCListTrendLine* ListTrend;
   MyCListHLine*     ListHLine;
public:
                     MyCListPattern();
                    ~MyCListPattern();
   //--- 
   void              Insert(double A, datetime tA, double B, datetime tB, 
                            double C, datetime tC, double D, datetime tD,
                            double E, datetime tE, double Ev,datetime tEv,
                            double M, datetime tM);

   color             GetColorArrow(void){return(ColorArrow);};
   color             GetColorTrend(void){return(ColorTrend);};
   ENUM_LINE_STYLE   GetStyleTrend(void){return(StyleTrend);};
   int               GetWidthTrend(void){return(WidthTrend);};
   bool              GetBackTrend(void){return(BackTrend);};
   ENUM_LINE_STYLE   GetStyleHLine(void){return(StyleHLine);};
   color             GetColorUpHLine(void){return(ColorUpHLine);};
   color             GetColorDownHLine(void){return(ColorDownHLine);};
   int               GetWidthHLine(void){return(WidthHLine);};
   bool              GetBackHLine(void){return(BackHLine);};

   void              SetColorArrow(color New){ColorArrow = New;};
   void              SetColorTrend(color New){ColorTrend = New;};
   void              SetStyleTrend(ENUM_LINE_STYLE New){StyleTrend=New;};
   void              SetWidthTrend(int New){WidthTrend = New;};
   void              SetBackTrend(bool New){BackTrend = New;};
   void              SetStyleHLine(ENUM_LINE_STYLE New){StyleHLine=New;};
   void              SetColorUpHLine(color New){ColorUpHLine=New;};
   void              SetColorDownHLine(color New){ColorDownHLine=New;};
   void              SetWidthHLine(int New){WidthHLine=New;};
   void              SetBackHLine(bool New){BackHLine=New;};
private:
   double            CorrectArrowChart(int nCorrectY, datetime time, 
                                       double price);
  };
//+------------------------------------------------------------------+
MyCListPattern::MyCListPattern()
  {
   ListArrow = new MyCListArrow;
   ListTrend = new MyCListTrendLine;
   ListHLine = new MyCListHLine;

   this.ColorArrow = clrBlue;
   this.ColorTrend = clrGold;
   this.StyleTrend = STYLE_SOLID;
   this.WidthTrend = 1;
   this.BackTrend  = true;
   this.StyleHLine = STYLE_SOLID;
   this.ColorUpHLine   = clrBlue;
   this.ColorDownHLine = clrRed;
   this.WidthHLine = 1;
   this.BackHLine  = true;
  }
//+------------------------------------------------------------------+
MyCListPattern::~MyCListPattern()
  {
   //---
   delete ListArrow;
   delete ListTrend;
   delete ListHLine;
  }
//+------------------------------------------------------------------+
void MyCListPattern::Insert(double A, datetime tA, double B, datetime tB, 
                            double C, datetime tC, double D, datetime tD,
                            double E, datetime tE, double Ev,datetime tEv,
                            double M, datetime tM)
  {
   if(A < 0 || B < 0 || C < 0 || D < 0 || E < 0) return;
   if(ListArrow.GetSize() > 0)
     {
      ListArrow.ClearAll();
     }
   if(ListTrend.GetSize() > 0)
     {
      ListTrend.ClearAll();
     }
   if(ListHLine.GetSize() > 0)
     {
      ListHLine.ClearAll();
     }

   ListArrow.Insert(CorrectArrowChart(-6, tA, A), tA);
   ListArrow.SetAtNameOfCode(ListArrow.GetLastArrowName(),  140);
   ListArrow.SetAtNameOfColor(ListArrow.GetLastArrowName(), ColorArrow);
   ListArrow.SetAtNameOfTip(ListArrow.GetLastArrowName(),"point A");
   
   ListArrow.Insert(CorrectArrowChart(-6, tB, B), tB);
   ListArrow.SetAtNameOfCode(ListArrow.GetLastArrowName(),  141);
   ListArrow.SetAtNameOfColor(ListArrow.GetLastArrowName(), ColorArrow);
   ListArrow.SetAtNameOfTip(ListArrow.GetLastArrowName(),"point B");

   ListArrow.Insert(CorrectArrowChart(-6, tC, C), tC);
   ListArrow.SetAtNameOfCode(ListArrow.GetLastArrowName(),  142);
   ListArrow.SetAtNameOfColor(ListArrow.GetLastArrowName(), ColorArrow);
   ListArrow.SetAtNameOfTip(ListArrow.GetLastArrowName(),"point C");

   ListArrow.Insert(CorrectArrowChart(-6, tD, D), tD);
   ListArrow.SetAtNameOfCode(ListArrow.GetLastArrowName(),  143);
   ListArrow.SetAtNameOfColor(ListArrow.GetLastArrowName(), ColorArrow);
   ListArrow.SetAtNameOfTip(ListArrow.GetLastArrowName(),"point D");

   ListArrow.Insert(CorrectArrowChart(-6, tE, E), tE);
   ListArrow.SetAtNameOfCode(ListArrow.GetLastArrowName(),  144);
   ListArrow.SetAtNameOfColor(ListArrow.GetLastArrowName(), ColorArrow);
   ListArrow.SetAtNameOfTip(ListArrow.GetLastArrowName(),"point E");
   //---
   if(Ev > 0)
     {
      ListArrow.Insert(CorrectArrowChart(-6, tEv, Ev), tEv);
      //ListArrow.Insert(Ev, tEv);
      ListArrow.SetAtNameOfCode(ListArrow.GetLastArrowName(),  108);
      ListArrow.SetAtNameOfColor(ListArrow.GetLastArrowName(), ColorArrow);
      ListArrow.SetAtNameOfTip(ListArrow.GetLastArrowName(),"Evolution");
     }
   //---
   if(M > 0)
     {
      ListArrow.Insert(CorrectArrowChart(-6, tM, M), tM);
      ListArrow.SetAtNameOfCode(ListArrow.GetLastArrowName(),  109);
      ListArrow.SetAtNameOfColor(ListArrow.GetLastArrowName(), ColorArrow);
      ListArrow.SetAtNameOfTip(ListArrow.GetLastArrowName(),"Mutation");
     }
   ListTrend.Insert("Line_A-B",A,tA,B,tB,StyleTrend);
   ListTrend.SetAtNameOfColor(ListTrend.GetLastTrendName(),ColorTrend);
   ListTrend.SetAtNameOfWidth(ListTrend.GetLastTrendName(),WidthTrend);
   ListTrend.SetAtNameOfBack(ListTrend.GetLastTrendName(), BackTrend);   
   //---
   ListTrend.Insert("Line_B-C",B,tB,C,tC,StyleTrend);
   ListTrend.SetAtNameOfColor(ListTrend.GetLastTrendName(),ColorTrend);
   ListTrend.SetAtNameOfWidth(ListTrend.GetLastTrendName(),WidthTrend);
   ListTrend.SetAtNameOfBack(ListTrend.GetLastTrendName(), BackTrend);   
   //---
   ListTrend.Insert("Line_C-D",C,tC,D,tD,StyleTrend);
   ListTrend.SetAtNameOfColor(ListTrend.GetLastTrendName(),ColorTrend);
   ListTrend.SetAtNameOfWidth(ListTrend.GetLastTrendName(),WidthTrend);
   ListTrend.SetAtNameOfBack(ListTrend.GetLastTrendName(), BackTrend);   
   //---
   ListTrend.Insert("Line_D-E",D,tD,E,tE,StyleTrend);
   ListTrend.SetAtNameOfColor(ListTrend.GetLastTrendName(),ColorTrend);
   ListTrend.SetAtNameOfWidth(ListTrend.GetLastTrendName(),WidthTrend);
   ListTrend.SetAtNameOfBack(ListTrend.GetLastTrendName(), BackTrend);
   //---
   if(Ev > 0)
     {
      ListTrend.Insert("Line_Evolution",E,tE,Ev,tEv,STYLE_DOT);
      ListTrend.SetAtNameOfColor(ListTrend.GetLastTrendName(),ColorTrend);
      ListTrend.SetAtNameOfWidth(ListTrend.GetLastTrendName(),1);
      ListTrend.SetAtNameOfBack(ListTrend.GetLastTrendName(), BackTrend);
     }
   //---
   if(M > 0) 
     {
      ListTrend.Insert("Line_Mutation",E,tE,M,tM,STYLE_DOT);
      ListTrend.SetAtNameOfColor(ListTrend.GetLastTrendName(),ColorTrend);
      ListTrend.SetAtNameOfWidth(ListTrend.GetLastTrendName(),1);
      ListTrend.SetAtNameOfBack(ListTrend.GetLastTrendName(), BackTrend);
     }
   //---
   if(A>B)
     {
      ListHLine.Insert(A, StyleHLine);
      ListHLine.SetAtNameOfColor(ListHLine.GetLastHLineName(),ColorUpHLine);
      ListHLine.SetAtNameOfWidth(ListHLine.GetLastHLineName(),WidthHLine);
      ListHLine.SetAtNameOfBack(ListHLine.GetLastHLineName(), BackHLine);
     }else
        {
         ListHLine.Insert(A, StyleHLine);
         ListHLine.SetAtNameOfColor(ListHLine.GetLastHLineName(),ColorDownHLine);
         ListHLine.SetAtNameOfWidth(ListHLine.GetLastHLineName(),WidthHLine);
         ListHLine.SetAtNameOfBack(ListHLine.GetLastHLineName(), BackHLine);
        }    
   //---
   if(B>C)
     {
      ListHLine.Insert(B, StyleHLine);
      ListHLine.SetAtNameOfColor(ListHLine.GetLastHLineName(),ColorUpHLine);
      ListHLine.SetAtNameOfWidth(ListHLine.GetLastHLineName(),WidthHLine);
      ListHLine.SetAtNameOfBack(ListHLine.GetLastHLineName(), BackHLine);
     }else
        {
         ListHLine.Insert(B, StyleHLine);
         ListHLine.SetAtNameOfColor(ListHLine.GetLastHLineName(),ColorDownHLine);
         ListHLine.SetAtNameOfWidth(ListHLine.GetLastHLineName(),WidthHLine);
         ListHLine.SetAtNameOfBack(ListHLine.GetLastHLineName(), BackHLine);
        }    
   //---
   if(C>D)
     {
      ListHLine.Insert(C, StyleHLine);
      ListHLine.SetAtNameOfColor(ListHLine.GetLastHLineName(),ColorUpHLine);
      ListHLine.SetAtNameOfWidth(ListHLine.GetLastHLineName(),WidthHLine);
      ListHLine.SetAtNameOfBack(ListHLine.GetLastHLineName(), BackHLine);
     }else
        {
         ListHLine.Insert(C, StyleHLine);
         ListHLine.SetAtNameOfColor(ListHLine.GetLastHLineName(),ColorDownHLine);
         ListHLine.SetAtNameOfWidth(ListHLine.GetLastHLineName(),WidthHLine);
         ListHLine.SetAtNameOfBack(ListHLine.GetLastHLineName(), BackHLine);
        }    
   //---
   if(D>E)
     {
      ListHLine.Insert(D, StyleHLine);
      ListHLine.SetAtNameOfColor(ListHLine.GetLastHLineName(),ColorUpHLine);
      ListHLine.SetAtNameOfWidth(ListHLine.GetLastHLineName(),WidthHLine);
      ListHLine.SetAtNameOfBack(ListHLine.GetLastHLineName(), BackHLine);
     }else
        {
         ListHLine.Insert(D, StyleHLine);
         ListHLine.SetAtNameOfColor(ListHLine.GetLastHLineName(),ColorDownHLine);
         ListHLine.SetAtNameOfWidth(ListHLine.GetLastHLineName(),WidthHLine);
         ListHLine.SetAtNameOfBack(ListHLine.GetLastHLineName(), BackHLine);
        }      
  }
//+------------------------------------------------------------------+
double MyCListPattern::CorrectArrowChart(int nCorrectY, datetime time, double price)
  {
   int      x=0, y=0, sub_window=0;
   double   m_price = price;
   datetime m_time  = time;

   if(ChartTimePriceToXY(0,sub_window,m_time,m_price,x,y))
     {
      if(ChartXYToTimePrice(0,x,(y+nCorrectY),sub_window,m_time,m_price)) return(m_price);
     }
   return(price);
  }
//+------------------------------------------------------------------+
