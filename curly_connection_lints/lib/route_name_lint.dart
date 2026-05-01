import 'package:analyzer/analysis_rule/analysis_rule.dart';
import 'package:analyzer/analysis_rule/rule_context.dart';
import 'package:analyzer/analysis_rule/rule_visitor_registry.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';
import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/error/error.dart';

class RouteNameMustBeStaticConst extends AnalysisRule {
  RouteNameMustBeStaticConst()
    : super(
        name: _code.name,
        description:
            'Classes registered in routes must declare a static const String routeName.',
      );

  static const _code = LintCode(
    'route_name_must_be_static_const',
    'Classes registered in routes must declare a static const String routeName.',
    correctionMessage: "Add: static const String routeName = '/your-route';",
    severity: DiagnosticSeverity.ERROR,
  );

  @override
  DiagnosticCode get diagnosticCode => _code;

  @override
  void registerNodeProcessors(
    RuleVisitorRegistry registry,
    RuleContext context,
  ) {
    registry.addMethodDeclaration(this, _MethodVisitor(this));
  }
}

class _MethodVisitor extends SimpleAstVisitor<void> {
  final RouteNameMustBeStaticConst rule;

  _MethodVisitor(this.rule);

  @override
  void visitMethodDeclaration(MethodDeclaration node) {
    // Ensure we are in the 'routes' method
    if (node.name.lexeme != 'routes') return;

    // Use accept for a full recursive traversal of the method
    final collector = _BuilderLambdaCollector();
    node.accept(collector);

    for (final lambda in collector.lambdas) {
      final instanceCollector = _InstanceCollector();
      lambda.accept(instanceCollector);

      for (final instance in instanceCollector.instances) {
        final type = instance.staticType;
        if (type == null) continue;

        final element = type.element;
        if (element is! InterfaceElement) continue;

        final hasStaticConstRouteName = element.fields.any(
          (f) => f.name == 'routeName' && f.isStatic && f.isConst,
        );

        if (!hasStaticConstRouteName) {
          rule.reportAtNode(instance);
        }
      }
    }
  }
}

/// Collects all named-parameter lambdas where parameter name is 'builder'
class _BuilderLambdaCollector extends RecursiveAstVisitor<void> {
  final List<FunctionExpression> lambdas = [];

  @override
  void visitNamedExpression(NamedExpression node) {
    if (node.name.label.name == 'builder') {
      final expression = node.expression;
      if (expression is FunctionExpression) {
        lambdas.add(expression);
      }
    }
    super.visitNamedExpression(node);
  }
}

/// Recursively collects all InstanceCreationExpressions
class _InstanceCollector extends RecursiveAstVisitor<void> {
  final List<InstanceCreationExpression> instances = [];

  @override
  void visitInstanceCreationExpression(InstanceCreationExpression node) {
    instances.add(node);
    super.visitInstanceCreationExpression(node);
  }
}
