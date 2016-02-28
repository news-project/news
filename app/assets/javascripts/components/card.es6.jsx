console.log($("div").eq(0).html());

class Card extends React.Component {
  render () {
    return (
      <div className="ui card">
	<div className="image">
	  <img src="http://img.hani.co.kr/imgdb/resize/2016/0227/00551780201_20160227.JPG"/>
	</div>
	<div className="content">
          <a className="header">{this.props.name}</a>
	  <div className="meta">
            <span className="date">Joined in {this.props.joined_at}</span>
	  </div>
	  <div className="description">
            Kristy is an art director living in New York.
	  </div>
	</div>
	<div className="extra content">
	  <a>
	    <i className="user icon"></i>
	    22 Friends
	  </a>
	</div>
      </div>      
    );
  }
}

Card.propTypes = {
  name: React.PropTypes.string,
  joined_at: React.PropTypes.number
};
