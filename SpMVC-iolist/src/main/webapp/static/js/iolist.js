document.addEventListener("DOMContentLoaded", () => {
  const io_body = document.querySelector("tbody.io_body");
  const btn_update = document.querySelector("input.btn_update");
  const btn_delete = document.querySelector("input.btn_delete");
  const io_body_onClick_handler = (e) => {
    const target = e.target;
    if ((target.tagName = "TD")) {
      const TR = target.closest("TR");
      const seq = TR.dataset.seq;
      // alert(seq);
      document.location.href = `/iolist/detail?io_seq=${seq}`;
    }
  };
  io_body?.addEventListener("click", io_body_onClick_handler);
  btn_update?.addEventListener("click", (e) => {
    const seq = e.target.dataset.seq;
    // alert(seq);
    document.location.href = `/iolist/update?seq=${seq}`;
  });
  btn_delete?.addEventListener("click", (e) => {
    const seq = e.target.dataset.seq;

    if (confirm("정말 삭제할까요?")) {
      document.location.replace(`/iolist/delete/${seq}`);
    }
  });
});
