import React from 'react';

export default function Section4SlideComponent({일일특가, setViewProduct}) {

        // 섹션4
        // 판매가격, 정가 콤머형식 함수
        const commaPrice=(price)=>{
            let value = price.toString();
            const regExp = /(^\d+)(\d{3})/g;
            while( regExp.test(value) ){
                return  value.replace(regExp, '$1,$2');
            }        
        }



        const onClickProductList=(e, item)=>{
            e.preventDefault();
            let obj = {            
                제품코드: item.제품코드,
                보관방법: item.보관방법,
                이미지: `http://localhost:3000/images/intro/${item.이미지}`,
                배송구분: item.배송구분,
                제조사: item.제조사,
                제품명: item.제품명,
                제품특성: item.제품특성,
                정가: item.정가,
                할인율: item.할인율,
                판매처: item.판매처,            
                저장일시: new Date().getTime()
            }
            setViewProduct(obj);  // 최상위 컴포넌트에게 전달
            window.location.pathname = '/product';
        }
    
      

    return (
        <div className="right">
            <ul>
            {                    
                일일특가.map((item)=>{
                            return(
                                <li className="slide slide0" key={item.제품코드}>
                                    <div className="col-gap">
                                        <a href="!#" onClick={(e)=>onClickProductList(e, item)}>
                                            <div className="img-box">
                                                <img src={`./images/intro/${item.이미지}`} alt="" />
                                                <span>
                                                    <img src="./images/sub1/icon_cart.svg" alt="" />
                                                </span>
                                            </div>
                                            <div className="tex-box">
                                                <ul>                                                        
                                                    <li>{item.배송구분}</li>
                                                    <li><strong>[item.제조사]</strong> <em>{item.제품명}</em></li>
                                                    <li>{}</li>
                                                    <li><span className='rate-price'>{item.할인율===0?``:`${Math.round(item.할인율*100)}%`}</span>{item.할인율 > 0 && (<span className='panme-price'>{commaPrice(42900*(1-item.할인율))}</span>) }</li>
                                                    <li>{ item.할인율===0? <span className='panme-price'>{commaPrice(item.정가)}</span> : <s>{commaPrice(item.정가)}</s> }</li>
                                                    <li>{ item.판매처 }</li>
                                                </ul> 
                                            </div>
                                        </a>
                                    </div>
                                </li>
                            )
                        })

                    }
            </ul>
        </div>
    );
};