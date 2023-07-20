import React from 'react';
import './scss/section1_slide.scss';


export default function Section1SlideComponent({슬라이드, n}) {
    
    const slideWrap = React.useRef();
    const [cnt, setCnt] = React.useState(0);

    React.useEffect(()=>{  
        slideWrap.current.style.width = `${100*(n+2)}%`;  // 100*20 = 2,000%
    },[슬라이드, n]);


    React.useEffect(()=>{

        slideWrap.current.style.transition = `all 0.6s ease-in-out`;
        slideWrap.current.style.left = `${-(100*cnt)}%`;
        // 처음으로 리턴 : 계속 롤링하기 위해서
        if(cnt>n){
            slideWrap.current.style.transition = `none`; // 애니메이션 없다
            slideWrap.current.style.left = `0%`;
            setCnt(1);
        }
        // 마지막으로 리턴 : 계속 롤링하기 위해서
        if(cnt<0){
            slideWrap.current.style.transition = `none`; // 애니메이션 없다
            slideWrap.current.style.left = `${-100*n}%`;
            setCnt(n-1);
        }

    },[cnt]);


    
    const onClickNext=(e)=>{
        e.preventDefault();
        setCnt(cnt+1);
    }
    const onClickPrev=(e)=>{
        e.preventDefault();
        setCnt(cnt-1);
    }


    // 슬라이드 클릭시 새로고침 발생 방지
    const onClickSlideEvent=(e, idx, src)=>{
        e.preventDefault();
        // console.log( idx, src );
        // if(idx===0){
        //     window.location.pathname = '/메인';
        // }
        // else if(idx===1){
        //     window.location.pathname = '/신상품';
        // }
        // else if(idx===2){
        //     window.location.pathname = '/베스트';
        // }
    }


    return (
        <div className="slide-container">
            <div className="slide-view">
                <ul ref={slideWrap}  className="slide-wrap">


                {
                    슬라이드.map((item,idx)=>{
                        return(
                            <li className="slide" key={idx}><a href="!#" onClick={(e)=>onClickSlideEvent(e, idx, item.src )}><img src={item.src} alt="" /></a></li>
                        )
                    })

                }
                    

                </ul>
            </div>


            <a href="!#" onClick={onClickPrev} className='left-arrorw-btn'><img src="./images/intro/icon_right_arrow_gray.svg" alt="" /></a>
            <a href="!#" onClick={onClickNext} className='right-arrorw-btn'><img src="./images/intro/icon_right_arrow_gray.svg" alt="" /></a>
            
            <span className='page-count-box'>
            <em className='current-number'>{cnt+1>n?1:cnt+1}</em>
            <i>/</i>     
            <em className='total-number'>{n}</em>
            </span>

        </div>
    );
};

