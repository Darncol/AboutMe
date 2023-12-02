

struct User {
    let login: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            login: "User",
            password: "password",
            person: Person(
                name: "Винни",
                surname: "Пух",
                age: "неизвестно",
                cartoonTitle: "Медвежонок Винни и его друзья",
                friends: "Пятачок",
                bio: "Винни-Пух – это главный герой серии детских книг британского автора А. А. Милна. Он представляет собой добродушного, немного наивного медведя, обожающего мёд и живущего в Высоком лесу. Пух известен своей добротой, искренностью и умением находить выход из затруднительных ситуаций, при этом часто вляпываясь в смешные истории. Он тесно дружит с такими персонажами, как Пятачок, Кролик, Сова и мальчик по имени Кристофер Робин, с которыми у него происходит множество приключений."
            )
        )
    }
}