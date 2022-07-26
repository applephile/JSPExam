//이렇게만 저장하는 것이 DTO

package common; //규칙1

public class Person {
	
	//규칙2
	private String name;
	private int age;
	
	//규칙3
	public Person() {}
	//인수를 받아서 초기화해주는 생성자
	public Person(String name, int age) {
		super();
		this.name = name;
		this.age = age;
	}

	//규칙4, 5
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}
	
}
