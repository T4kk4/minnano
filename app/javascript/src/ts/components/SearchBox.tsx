import * as React from "react";
// import axios from "axios";

interface SearchBoxProps {
  prefectures: [{name: string, cities: [{id: number, name: string}]}]
}

interface SearchBoxState {
  cities: [{id: number, name: string}]
}

class SearchBox extends React.Component<SearchBoxProps, SearchBoxState> {
  constructor(props) {
    super(props);
    this.state = {
      cities: props.prefectures.find(p => p.name === '東京都').cities
    };
  }

  componentDidMount() {
    // axios
    //   .get("http://localhost:3000/api/home")
    //   .then(results => {
    //     const data = results.data;
    //     console.log(data);
    //   })
    //   .catch(e => {
    //     console.log("ERROR!! occurred in Backend.", e);
    //   });
  }

  onChangePrefectureValue(e) {
    const selectedPrefecture = e.target.value;
    const prefecture = this.props.prefectures.find(p => p.name === selectedPrefecture);
    this.setState({cities: prefecture.cities});
  }

  render() {
    return (
      <>
        <h2 className="c-title">
          絞り込み
        </h2>
        <form method="get" className="p-top__form" action='/search'>
          <fieldset>
            <legend>事務所の場所</legend>
            <div className="p-top__form-prefecture-select">
              <label>
                <span className="p-top__form-title">都道府県</span>
                <div className="p-top__form-select-wrap">
                  <select name="prefecture" className="p-top__form-place" defaultValue="東京都" onChange={(e) => this.onChangePrefectureValue(e)}>
                    <option value="">都道府県を選択してください</option>
                    {this.props.prefectures.map((p, i) => <option value={p.name} key={i}>{p.name}</option>)}
                  </select>
                </div>
              </label>
              <label>
                <span className="p-top__form-title">市区町村</span>
                <div className="p-top__form-select-wrap">
                  <select name="city" defaultValue="" className="p-top__form-place">
                    <option value="">市区町村を選択してください</option>
                    {this.state.cities.map(c => <option value={c.name} key={c.id}>{c.name}</option>)}
                  </select>
                </div>
              </label>
            </div>
          </fieldset>
          <fieldset>
            <legend>相談したいこと</legend>
            <div className="p-top__form-want">
              <div className="p-top__form-want-child">
                <span className="p-top__form-title">相談したい内容</span>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="顧問税理士・法人決算" name="specialty_field[]" />顧問税理士・法人決算
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="個人確定申告" name="specialty_field[]" />個人確定申告
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="会社設立・起業" name="specialty_field[]" />会社設立・起業
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="節税対策" name="specialty_field[]" />節税対策
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="事業承継・M&A" name="specialty_field[]" />事業承継・M&A
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="相続税" name="specialty_field[]" />相続税
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="融資・資金調達・金融機関対応" name="specialty_field[]" />融資・資金調達・金融機関対応
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="記帳・経理業務サポート" name="specialty_field[]" />記帳・経理業務サポート
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="給与計算・年末調整" name="specialty_field[]" />給与計算・年末調整
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="助成金・補助金申請" name="specialty_field[]" />助成金・補助金申請
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="海外税務" name="specialty_field[]" />海外税務
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="資金繰り表作成・経営指導サポート" name="specialty_field[]" />資金繰り表作成・経営指導サポート
                </label>
              </div>
              <div className="p-top__form-want-child">
                <span className="p-top__form-title">相談したい業種</span>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="不動産" name="specialty_industry[]" />不動産
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="金融" name="specialty_industry[]" />金融
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="飲食" name="specialty_industry[]" />飲食
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="流通・小売" name="specialty_industry[]" />流通・小売
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="建築・建設" name="specialty_industry[]" />建築・建設
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="IT・インターネット" name="specialty_industry[]" />IT・インターネット
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="美容" name="specialty_industry[]" />美容
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="運輸・物流" name="specialty_industry[]" />運輸・物流
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="製造" name="specialty_industry[]" />製造
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="教育" name="specialty_industry[]" />教育
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="医療・福祉" name="specialty_industry[]" />医療・福祉
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="旅行・ホテル" name="specialty_industry[]" />旅行・ホテル
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="ファンド" name="specialty_industry[]" />ファンド
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="社会福祉法人" name="specialty_industry[]" />社会福祉法人
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="医療法人" name="specialty_industry[]" />医療法人
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="NPO法人" name="specialty_industry[]" />NPO法人
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="学校法人" name="specialty_industry[]" />学校法人
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="一般社団法人" name="specialty_industry[]" />一般社団法人
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="アミューズメント・レジャー" name="specialty_industry[]" />アミューズメント・レジャー
                </label>
                <label className="p-top__form-check-label">
                  <input type="checkbox" className="p-top__form-check" value="その他" name="specialty_industry[]" />その他
                </label>
              </div>
            </div>
          </fieldset>
          <p className="p-top__btn">
            <button type="submit" className="c-btn-search">検索する</button>
          </p>
        </form>
      </>
    );
  }
}

export default SearchBox;
