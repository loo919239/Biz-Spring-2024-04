document.addEventListener("DOMContentLoaded", async () => {
  const fileInput = document.querySelector("input.file.single");
  const filesInput = document.querySelector("input.file.multi");
  const prevImg = document.querySelector("img.gallery");
  const imgBorderBox = document.querySelector("div.image");
  const base64Box = document.querySelector("textarea.base64");
  const multiImageBox = document.querySelector("div.image.multi");

  const ecodeImageFileAsBase64 = async (image) => {
    return new Promise((resoleve, _) => {
      const reader = new FileReader();
      reader.onloadend = () => {
        resoleve(reader.result);
      };
      reader.readAsDataURL(image);
    });
  };

  prevImg.addEventListener("click", () => filesInput.click());

  imgBorderBox.addEventListener("paste", async (e) => {
    const items = e.clipboardData.items;
    // images 객체가 존재하면 그중 0번째 요소를 getter 하기
    const item = items?.[0];
    // image.png, text/plan, application/text,
    // 붙여넣기 한 데이터가 image/* 이면~~
    if (item.type.indexOf("image") === 0) {
      // 붙어넣기 한 이미지 중에서 파일만 추출하기
      const blob = item.getAsFile();
      console.log(blob);
      // 파일이 추출이 안되면
      if (!blob) {
        return null;
      }
      const base64 = await ecodeImageFileAsBase64(blob);
      prevImg.src = base64;
      base64Box.value = base64;
    } else {
      alert("이미지만 붙여 넣기 하세요");
    }
  });

  const filePreView = async (file) => {
    const base64 = await ecodeImageFileAsBase64(file);
    if (base64) {
      const img = document.createElement("img");
      img.style.width = "100px";
      img.src = base64;
      multiImageBox.appendChild(img);
    }
  };

  filesInput.addEventListener("change", async (e) => {
    const files = e.target.files;
    multiImageBox.innerHTML = "";
    for (let file of files) {
      await filePreView(file);
    }
  });

  fileInput.addEventListener("change", async (e) => {
    // 이미지 파일의 미리보기
    const target = e.target;

    const file = target.files[0];

    await filePreView(file);

    // const base64 = await ecodeImageFileAsBase64(file);
    // prevImg.src = base64;
  });
});
