document.addEventListener("DOMContentLoaded", () => {
  const join_form = document.querySelector("form.join");
  const btn_join = join_form.querySelector("button");

  const username = join_form.querySelector("input[name='username']");
  const password = join_form.querySelector("input[name='password']");
  const re_password = join_form.querySelector(
    "input[name='re_password']"
  );

  // username은 영대소문자와 언더바(_)를 사용할수 있으며 4 ~ 20글자까지 가능
  const usernameExp = /^[a-zA-Z0-9_]{4,20}$/;
  const passwordExp = /^[a-zA-Z0-9!@#$%^&*()_]{8,20}$/;
  const idCheck = async (username) => {
    try {
      const res = await fetch(`${rootPath}/user/idcheck/${username}`);
      // const json = await res.json(); // server 가 json type 의 데이터를 보낼 때
      const result = await res.text();
      return result === "OK";
    } catch (error) {
      alert("서버와 통신 오류");
    }
  };
  btn_join.addEventListener("click", async () => {
    if (!username.value) {
      alert("USERNAME 은 반드시 입력하세요");
      username.select();
      return false;
    }
    if (!usernameExp.test(username.value)) {
      alert(
        "USERNAME 은 영문 대소문자, 숫자, _ 로 4~20글자만 가능합니다"
      );
      username.select();
      return false;
    }

    if (!(await idCheck(username.value))) {
      alert("이미 가입된 username 입니다");
      username.select();
      return false;
    }

    if (!password.value) {
      alert("PASSWORD 은 반드시 입력하세요");
      password.select();
      return false;
    }
    if (!passwordExp.test(password.value)) {
      alert(
        "비밀번호는 8자리 이상 영문, 숫자, 특수문자 만 가능합니다."
      );
      password.select();
      return false;
    }

    if (password.value !== re_password.value) {
      alert("비밀번호와 비밀번화 확인이 일치하지 않습니다.");
      password.select();
      return false;
    }

    // form 의 전송 실행하기
    join_form.submit();
  });
});
