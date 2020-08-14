package react;

import react.ReactComponent.ReactElement;

/**
	https://facebook.github.io/react/docs/react-api.html
**/
#if (!react_global)
@:jsRequire("react")
#end
@:native('React')
extern class React
{
	// Warning: react.React.PropTypes is deprecated, reference as react.ReactPropTypes

	/**
		https://facebook.github.io/react/docs/react-api.html#createelement
	**/
	public static function createElement(type:CreateElementType, ?attrs:Dynamic, children:haxe.extern.Rest<Dynamic>):ReactElement;

	/**
		https://facebook.github.io/react/docs/react-api.html#cloneelement
	**/
	public static function cloneElement(element:ReactElement, ?attrs:Dynamic, children:haxe.extern.Rest<Dynamic>):ReactElement;

	/**
		https://facebook.github.io/react/docs/react-api.html#isvalidelement
	**/
	public static function isValidElement(object:Dynamic):Bool;

	#if react_context_api
	/**
		https://reactjs.org/docs/context.html#reactcreatecontext
		Note: this API has been introduced in React 16.3
	**/
	public static function createContext<T>(?defaultValue:T, ?calculateChangedBits: T->T->Int):ReactContext<T>;
	#end

	#if react_ref_api
	/**
		https://reactjs.org/docs/react-api.html#reactcreateref

		Note: this API has been introduced in React 16.3
		If you are using an earlier release of React, use callback refs instead
		https://reactjs.org/docs/refs-and-the-dom.html#callback-refs
	**/
	public static function createRef<TRef>():ReactRef<TRef>;
	#end

	#if react_ref_api
	/**
		https://reactjs.org/docs/react-api.html#reactforwardref
		See also https://reactjs.org/docs/forwarding-refs.html

		Note: this API has been introduced in React 16.3
		If you are using an earlier release of React, use callback refs instead
		https://reactjs.org/docs/refs-and-the-dom.html#callback-refs
	**/
	public static function forwardRef<TProps, TRef>(render:TProps->ReactRef<TRef>->ReactElement):CreateElementType;
	#end

	/**
		https://facebook.github.io/react/docs/react-api.html#react.children
	**/
	public static var Children:ReactChildren;

	public static var version:String;

	/** Hooks **/

	/**
		https://reactjs.org/docs/hooks-reference.html#useeffect
	**/
	public static function useEffect(func:Dynamic, deps:Array<Dynamic>=null):Dynamic;

	/**
		https://reactjs.org/docs/hooks-reference.html#usememo
	**/
	public static function useMemo(func:Dynamic, deps:Array<Dynamic>=null):Dynamic;

	/**
		https://reactjs.org/docs/hooks-reference.html#usestate
	**/
	public static function useState(initialState:Dynamic):Array<Dynamic>;

	/**
		https://reactjs.org/docs/hooks-reference.html#usecontext
	**/
	public static function useContext(myContext:Dynamic):Dynamic;

	/**
		https://reactjs.org/docs/hooks-reference.html#useref
	**/
	public static function useRef(ref:Dynamic):Dynamic;

	/**
		https://reactjs.org/docs/hooks-reference.html#useimperativehandle
	**/
	public static function useImperativeHandle(ref:Dynamic, createHandle:Dynamic, deps:Array<Dynamic>=null):Void;

	/**
		https://reactjs.org/docs/hooks-reference.html#usereducer
	**/
	public static function useReducer(reducer:Dynamic, initialArg:Dynamic, init:Dynamic):Array<Dynamic>;

	/**
		https://reactjs.org/docs/hooks-reference.html#usedebugvalue
	**/
	public static function useDebugValue(value:Dynamic):Void;
}

/**
	https://facebook.github.io/react/docs/react-api.html#react.children
**/
extern interface ReactChildren
{
	/**
		https://facebook.github.io/react/docs/react-api.html#react.children.map
	**/
	function map(children:Dynamic, fn:ReactElement->ReactElement):Dynamic;

	/**
		https://facebook.github.io/react/docs/react-api.html#react.children.foreach
	**/
	function foreach(children:Dynamic, fn:ReactElement->Void):Void;

	/**
		https://facebook.github.io/react/docs/react-api.html#react.children.count
	**/
	function count(children:Dynamic):Int;

	/**
		https://facebook.github.io/react/docs/react-api.html#react.children.only
	**/
	function only(children:Dynamic):ReactElement;

	/**
		https://facebook.github.io/react/docs/react-api.html#react.children.toarray
	**/
	function toArray(children:Dynamic):Array<Dynamic>;
}

typedef CreateElementType = haxe.extern.EitherType<haxe.extern.EitherType<String, haxe.Constraints.Function>, Class<ReactComponent>>;

#if react_context_api
typedef ReactContext<T> = {
	var displayName:String;
	var Provider:{value:T}->ReactElement;
	var Consumer:T->ReactElement;
}
#end
