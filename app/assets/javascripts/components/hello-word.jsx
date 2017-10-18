class HelloWorld extends React.Component {

    render() {
        var total = this.props.total
        return <div>Hello World
            {total}
        </div>
    }
}