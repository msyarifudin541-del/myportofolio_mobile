class ProjectEntry {
  final String title;
  final String category;
  final String description;
  final String techStack;
  final String repoUrl;
  final String thumbnailUrl;
  final int year;
  final bool isFeatured;

  ProjectEntry({
    required this.title,
    required this.category,
    required this.description,
    required this.techStack,
    required this.repoUrl,
    required this.thumbnailUrl,
    required this.year,
    required this.isFeatured,
  });
}

// Menyimpan daftar proyek yang ditambahkan selama sesi aplikasi berjalan
final List<ProjectEntry> savedProjects = [
  ProjectEntry(
    title: "MyPortfolio Web & Mobile",
    category: "Full-Stack Web",
    description:
        "Aplikasi portofolio pribadi berbasis Django REST Framework dan Flutter.",
    techStack: "Python, Django, Dart, Flutter",
    repoUrl: "https://github.com/msyarifudin541-del/myportofolio",
    thumbnailUrl: "",
    year: 2026,
    isFeatured: true,
  ),
];