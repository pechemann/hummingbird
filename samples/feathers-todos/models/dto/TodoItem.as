package models.dto {
	
	import org.flashapi.hummingbird.utils.DtoUtil;
	
	public class TodoItem {
		
		public var description:String;
		
		public var isCompleted:Boolean = false;
		
		public function toString():String {
			return DtoUtil.formatToString(this, "TodoItem", "description", "isCompleted");
		}
	}
}
