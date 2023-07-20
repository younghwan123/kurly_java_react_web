import React from 'react';
import {Link} from 'react-router-dom';
import '../scss/signin.scss';
import axios from 'axios';
import {ConfirmContext} from '../../../context/ConfirmContext';
import {GlobalContext} from '../../../context/GlobalContext';
import {useNavigate}  from 'react-router-dom';
import CryptoJS from 'crypto-js';

export default function SignInComponent () {


    // 라우터 네비게이트 훅 사용 등록
    const navigate = useNavigate();
    const {login, setLogin, signin, setSigin} = React.useContext(GlobalContext);
    const {confirmModalOpen, isConfirmModal} = React.useContext(ConfirmContext);

    // 아이디, 비밀번호 
    const [state, setState] = React.useState({
        user_id: '',
        user_pw: ''
    });
    const {user_id,user_pw} = state;

    // 아이디 입력상자
    const onChangeUser_id=(e)=>{
        setState({
            ...state,
            user_id: e.target.value
        })
    }

    // 비밀번호 입력상자
    const onChangeUser_pw=(e)=>{
        setState({
            ...state,
            user_pw: e.target.value
        })
    }



    // 로그인 구현
    // user_signin_action.jsp
    const onClickLogin=(e)=>{
        e.preventDefault();

        if(user_id===''){
            confirmModalOpen('아이디를 확인하고 입력하세요!');
        }
        else if(user_pw===''){
            confirmModalOpen('비밀번호를 확인하고 입력하세요!');
        }
        else {

            axios({
                // url:'/kurly/user_signin_action.jsp',
                url:'/kurly/kurly_user_signin_action_react.jsp',
                method: 'POST', // 비밀번호가 아이디가 나갈 때는 전송방식은 반드시 POST
                data:{},
                params: {
                    "user_id": user_id,
                    "user_pw": user_pw
                }
            })
            .then((res)=>{
                
                if(res.status===200){
                    const result = res.data;
                    try {                    
                        if( result === -1 ){
                            confirmModalOpen('가입회원이 아닙니다. 회원가입하세요');
                            setTimeout(function(){
                                window.location.pathname = `/signup`;
                            }, 1000);                                                       
                        }
                        else if( result === 0 ){
                            confirmModalOpen('비밀번호를 확인하고 다시 시도해주세요');                        
                        }
                        else{
                            
                            let toDay = new Date();
                            toDay.setDate(toDay.getDate()+3); //로그인이 3일 만료일
                                            
                            setSigin({
                                user_id: user_id,
                                expires: toDay.getTime()
                            })
                            
                            const obj = { // 로그인 정보 암호화
                                user_id: user_id,
                                expires: toDay.getTime()
                            }
                            console.log(obj);

                            // 암호화 Encryption
                            let encryption = CryptoJS.AES.encrypt(JSON.stringify(obj), signin.signinKey).toString(); // 객체는 JSON.stringify 해주기
                            // encryption = encryption.replaceAll('=',' ') // = 삭제
                            localStorage.setItem(signin.signinKey, JSON.stringify(obj)); // 암호화된 로그인 정보 로컬에 저장    

                            confirmModalOpen('로그인이 되었습니다.');
                            // setTimeout(function(){
                            //      window.location.pathname = `/main`;
                            // }, 1000); 
                        }
                    } catch (error) {
                        console.log( error );
                    }
                }
                
            })
            .catch((err)=>{
                console.log(`AXIOS 실패! ${err} `)
            });  

        }

    }


    // 로그인 유지하기
    React.useEffect(()=>{
        // 로컬스토레이지 로그인 정보 가져오기
        let encryption='';
        let result = '';

        if( localStorage.getItem(signin.signinKey)!==null ){

           // 암호화된 정보를 스토리지 저장소에서 가져온다
            // encryption = localStorage.getItem(signin.signinKey); 
            result = JSON.parse(localStorage.getItem(signin.signinKey)); 

            // 가져온 암호를 해독한다(복호화)
            //복호화 Decryption
            // const decryption = CryptoJS.AES.decrypt(encryption, signin.signinKey);
                            
            // 복호화된 정보를 완전한 데이터(정보)로 변환
            // const decryptionData = JSON.parse(decryption.toString(CryptoJS.enc.Utf8));
            // console.log(decryptionData);

            //  result = decryptionData;
             if( new Date() > result.expires){
                alert('만료일이 지났습니다. 로그아웃되었습니다.');
                setSigin({
                    ...signin,
                    user_id: '',
                    expires: ''
                })
                 localStorage.removeItem(signin.signinKey); // 로그인 정보 모두 삭제
             } 
             else{
                setSigin({
                    ...signin,
                    user_id: result.user_id,
                    expires: result.expires
                 })
             }
        }

    },[signin]);

    return (
        <main id='signIn'>
            <section id="secino1">
                <div className="container">
                    <div className="title">
                        <h2>로그인</h2>
                    </div>
                    <div className="content">
                        <form autoComplete='off'>
                            <ul>
                                <li>
                                    <input 
                                    onChange={onChangeUser_id}
                                    type="text" 
                                    name='user_id' 
                                    id='userId' 
                                    value={user_id} 
                                    placeholder='아이디를 입력해주세요' 
                                    />
                                </li>
                                <li>
                                    <input 
                                    onChange={onChangeUser_pw}
                                    type="password" 
                                    name='user_pw' 
                                    id='userPw' 
                                    value={user_pw} 
                                    placeholder='비밀번호를 입력해주세요' 
                                    />
                                </li>
                                <li>
                                    <span>
                                        <Link to="/idSearch">아이디 찾기</Link>
                                        <i>|</i>
                                        <Link to="/pwSearch">비밀번호 찾기</Link>
                                    </span></li>
                                <li><button  onClick={onClickLogin}>로그인</button></li>
                                <li><Link to="/signup">회원가입</Link></li>
                            </ul>
                        </form>
                    </div>
                </div>
            </section>
        </main>
    );
};