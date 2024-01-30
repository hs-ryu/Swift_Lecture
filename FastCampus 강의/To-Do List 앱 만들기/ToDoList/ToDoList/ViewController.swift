//
//  ViewController.swift
//  ToDoList
//
//  Created by ryu hyunsun on 2022/07/10.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet var editButton: UIBarButtonItem!
    var doneButton: UIBarButtonItem?
    
    var tasks: [Task] = [] {
        didSet {
            self.saveTasks()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    // selector는 object-c에서 클래스 메서드의 이름을 가리키는데 사용되는 참조타입. 동적 호출 등을 목적으로 사용되었음.
        // swift로 넘어오면서 구조체 형식으로 정의가 되고, 해당 타입의 값을 생성할 수 있게됨.
        // doneButton을 선택했을때 doneButtonTab 메서드가 호출됨.
        self.doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTab))
        // tasks 배열에 저장되어 있는 할일들을 tableView에 표시되게 하기.
        self.tableView.dataSource = self
        // Do any additional setup after loading the view.
        self.tableView.delegate = self
        self.loadTasks()
    }
    
    @objc func doneButtonTab(){
        self.navigationItem.leftBarButtonItem = self.editButton
        self.tableView.setEditing(false, animated: true)
    }
    
    
    @IBAction func tabEditButton(_ sender: UIBarButtonItem) {
        
        guard !self.tasks.isEmpty else { return }
        self.navigationItem.leftBarButtonItem = self.doneButton
        self.tableView.setEditing(true, animated: true)
        
        
    }
    
    @IBAction func tabAddButton(_ sender: UIBarButtonItem) {
        let alert = UIAlertController(title: "할일 등록", message: nil, preferredStyle: .alert)
        // 클로저 선언부에서 캡쳐 목록 정의. 클래스처럼 클로저는 참조타입이기 때문에 클로저의 본문에서 self로 클래스의 인스턴스를 캡쳐할 때 강한 순환 참조가 발생할 수 있음. 강한 순환 참조란 ARC의 단점이기도 한데, 두개의 객체가 상호 참조하는 경우 강한 순환참조가 만들어지게 되는데, 이렇게 되면 순환 참조에 연관된 객체들은 레퍼런스 카운트가 0에 도달하지 않게되고, 메모리 누수가 발생하게 됨. 강한참조를 해결하는 방법은? 클로저와 클래스 인스턴스 사이에 강한 참조를 해결하는 방법은 클로저의 선언부에서 캡처 목록을 정의하는것으로 해결할 수 있음.
        let registerButton = UIAlertAction(title: "등록", style: .default, handler: { [weak self] _ in
            // 0번째에 접근하는 이유는, alert에 텍스트필드를 여러개 추가할 수 있는데, 우리는 1개만 추가했기 때문임.
            guard let title = alert.textFields?[0].text else { return }
            let task = Task(title: title, done: false)
            self?.tasks.append(task)
            self?.tableView.reloadData()
        })
        let cancelButton = UIAlertAction(title:"취소", style: .cancel, handler: nil)
        
        alert.addAction(cancelButton)
        alert.addAction(registerButton)
        alert.addTextField(configurationHandler: { textField in
            textField.placeholder = "할 일을 입력해 주세요."
            
        })
        self.present(alert, animated: true, completion: nil)
    }
    
    func saveTasks() {
        let data = self.tasks.map {
            [
                "title": $0.title,
                "done": $0.done
            ]
        }
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: "tasks")
        
    }
    
    func loadTasks() {
        let userDefaults = UserDefaults.standard
        guard let data = userDefaults.object(forKey: "tasks") as? [[String: Any]] else {return}
        self.tasks = data.compactMap {
            // 딕셔너리에는 any 타입으로 들어가 있을거니까, 타입 캐스팅 ㄱ
            guard let title = $0["title"] as? String else { return nil}
            guard let done = $0["done"] as? Bool else { return nil}
            return Task(title: title, done: done)
        }
    }
    
    
    
}

// UITableViewDataSource 프로토콜을 준수하도록 설정.
extension ViewController: UITableViewDataSource {
    // 행의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tasks.count
    }
    // 특정 섹션의 n번째 Row를 그리는데 필요한 셀을 반환
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // dequeueReusableCell 메서드는 지정된 재사용 식별자에 대한 재사용가능한 테이블뷰 셀 객체를 반환하고, 이를 테이블뷰에 추가하는 역할
        // 지정된 재사용 식별자 : withIdentifier 파라미터. Identifier값을 넘겨주면 그 값을 가지고 재 사용할 셀을 찾음.
        // for 파라미터에 indexPath 값을 넘겨주는 이유? indexPath 위치에 해당 셀을 재사용하기 위해.
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let task = self.tasks[indexPath.row]
        cell.textLabel?.text = task.title
        if task.done == true {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    // 편집모드에서 삭제 버튼을 눌렀을때 삭제버튼이 눌러진 셀이 어떤 셀인지 알려주는 메서드
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        self.tasks.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
        
        if self.tasks.isEmpty {
            self.doneButtonTab()
        }
    }
    
    // 테이블 뷰의 셀들의 위치를 이동시킬때 사용. 다른위치로 이동하면 sourceIndexPath 파라미터를 통해 원래 있었던 위치를 알려주고, destinationIndexPath 파라미터를 통해 어디로 이동했는지 알려줌.
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        var tasks = self.tasks
        let task = tasks[sourceIndexPath.row]
        tasks.remove(at: sourceIndexPath.row)
        tasks.insert(task, at: destinationIndexPath.row)
        self.tasks = tasks
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var task = self.tasks[indexPath.row]
        task.done = !task.done
        self.tasks[indexPath.row] = task
        self.tableView.reloadRows(at: [indexPath], with: .automatic)
    }
}
