class ProjectEntry {
  final String projectName;
  final String description;
  final String category;
  final String technologies;
  final String projectLink;

  ProjectEntry({
    required this.projectName,
    required this.description,
    required this.category,
    required this.technologies,
    required this.projectLink,
  });
}

// Menyimpan daftar proyek selama aplikasi berjalan
final List<ProjectEntry> savedProjects = [
  ProjectEntry(
    projectName: "MyPortfolio Web & Mobile",
    description:
        "Aplikasi portofolio pribadi berbasis Django REST Framework dan Flutter.",
    category: "Web Development",
    technologies: "Python, Django, Dart, Flutter",
    projectLink: "https://github.com/msyarifudin541-del/myportofolio",
  ),
];