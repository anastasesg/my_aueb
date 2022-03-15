abstract class BaseMapper<Entity, Model> {
  Entity toEntity(Model model);
  List<Entity> toEntities(List<Model> models);
  Future<Model> toModel(Entity entity);
  Future<List<Model>> toModels(List<Entity> entities);
}
