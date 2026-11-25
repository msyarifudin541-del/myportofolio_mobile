// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Project _$ProjectFromJson(Map<String, dynamic> json) => Project(
  title: json['title'] as String,
  description: json['description'] as String,
  techStack: json['tech_stack'] as String,
  projectUrl: json['project_url'] as String,
  projectImageUrl: json['project_image_url'] as String? ?? '',
  id: json['id'] as String?,
);

Map<String, dynamic> _$ProjectToJson(Project instance) => <String, dynamic>{
  'title': instance.title,
  'description': instance.description,
  'tech_stack': instance.techStack,
  'project_url': instance.projectUrl,
  'project_image_url': instance.projectImageUrl,
};
