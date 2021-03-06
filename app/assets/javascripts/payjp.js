document.addEventListener(
  "DOMContentLoaded", e => {
    if (document.getElementById("token_submit") != null) {    //token_submitというidがnullの場合、下記コードを実行しない

      const KEY = gon.PAYJP_KEY;// 公開鍵は環境変数から取得
      Payjp.setPublicKey(KEY) //公開鍵をセット

      let btn = document.getElementById("token_submit");    //IDがtoken_submitの場合に取得される
      btn.addEventListener("click", e => {    //ボタンが押された時に作動
        e.preventDefault();     //ボタンを一旦無効化する
        let card = {
          number: document.getElementById("payment_card_no").value,
          cvc: document.getElementById("cvc").value,
          exp_month: document.getElementById("payment_card_month").value,
          exp_year: document.getElementById("payment_card_year").value
        };      //入力されたデータを取得する

        Payjp.createToken(card, (status, response) => {
          if (status === 200) {
            $("#card_number").removeAttr("name");
            $("#cvc").removeAttr("name");
            $("#exp_month").removeAttr("name");
            $("#exp_year").removeAttr("name");    //データを自サーバにpostしないように削除
            $("#card_token").append(
              $('<input type="hidden" name="payjpToken">').val(response.id)
            );      //取得したトークンを送信できる状態にする
            document.inputForm.submit();
            alert("登録が完了しました")     //確認用
          } else {
            alert("カード情報が正しくありません");    //確認用
          }
        });

      });
    }
  },
  false
);
