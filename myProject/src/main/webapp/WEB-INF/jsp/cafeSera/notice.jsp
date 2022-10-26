<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Café SERA - NOTICE</title>
</head>
<body>

<%@ include file="header.jsp" %>

<section class="notice_section">

       
        <div class="notice_table">
            <div class="notice_title">NOTICE</div>
            <table style="border-top: 2px solid #32618D; border-bottom: 2px solid #32618D; margin-top: 40px;">
                <colgroup> 
                <!--col태그는 표에서 하나 이상의 td태그에 대해 속성값을 정의-->
                <!-- 여기서는 각 열의 크기를 지정-->
                     <col width="15%"/>
                    <col width="*"/>
                    <col width="20%"/>  <!--나머지 크기-->
                    
                </colgroup>

                
                <!-- <thead>
                    <th  style="height:5px" colspan="3" ></th> 
                   

                </thead> -->

                <!--테이블 내용 부분-->
                <tbody>
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                    <tr>
                        <td>[공지]</td>
                        <td class="article"><a class="notice_a" href="#none">5/23(월) 개인사정으로 쉬어갑니다.</a></td>
                        <td class="table_td">2022-05-12</td>
                    </tr>
                    <tr>
                        <td>[출시]</td>
                        <td class="article"><a class="notice_a" href="#none">5/10(화) 신메뉴 출시!! <br> &nbsp;&nbsp;&nbsp;&nbsp;- 샤이닝 스파클링, 애플망고 스무디, 포멜로 라임티  </a></td>
                        <td class="table_td">2022-05-03</td>
                    </tr>
                    <tr>
                        <td>[이벤트]</td>
                        <td class="article"><a class="notice_a" href="#none">4/14(월) 블랙데이 기념 : 혼자 오신 분들께 젤리를 드려요  </a></td>
                        <td class="table_td">2022-04-14</td>
                        
                    </tr>
                    <tr>
                        <td>[공지]</td>
                        <td class="article"><a class="notice_a" href="#none">4/07(월) 개인사정으로 오후 3시부터 오픈합니다.</a></td>
                        <td class="table_td">2022-03-29</td>
                    </tr>
                    <tr>
                        <td>[이벤트]</td>
                        <td class="article"><a class="notice_a" href="#none">3/14(월) 화이트데이 기념 : 음료 구매시 사탕드려요  </a></td>
                        <td class="table_td">2022-03-14</td>
                        
                    </tr>               
                    <tr>
                        <td>[이벤트]</td>
                        <td class="article"><a class="notice_a" href="#none">2/14(월) 발렌타인데이 기념 : 음료 구매시 초콜렛을드려요  </a></td>
                        <td class="table_td">2022-02-14</td>
                        
                    </tr>
                    <tr>
                        <td>[이벤트]</td>
                        <td class="article"><a class="notice_a" href="#none">2022년 새해맞이 이벤트!! <br> &nbsp;&nbsp;&nbsp;&nbsp;- 호랑이 쿠키 받아가세요~  </a></td>
                        <td class="table_td">2022-01-01</td>
                        
            
                    <tr>
                        <td colspan="3"></td>
                    </tr>
                </tbody>

                <!--테이블 꼬리말-->
                <tfoot>
                    
                </tfoot>
            </table>

        </div>

    </section>


<%@ include file="footer.jsp" %>

</body>
</html>