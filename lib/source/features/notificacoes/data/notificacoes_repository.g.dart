// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notificacoes_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificacoesRepositoryHash() =>
    r'e701073a2e7addcd016a879c07c35f2a0b65184b';

/// See also [notificacoesRepository].
@ProviderFor(notificacoesRepository)
final notificacoesRepositoryProvider = Provider<NotificacaoRepository>.internal(
  notificacoesRepository,
  name: r'notificacoesRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificacoesRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NotificacoesRepositoryRef = ProviderRef<NotificacaoRepository>;
String _$notificacoesQueryHash() => r'81fc0b520bd783c626bca70d23b1cf48cfd24f87';

/// See also [notificacoesQuery].
@ProviderFor(notificacoesQuery)
final notificacoesQueryProvider =
    AutoDisposeProvider<Query<Notificacao>>.internal(
  notificacoesQuery,
  name: r'notificacoesQueryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificacoesQueryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef NotificacoesQueryRef = AutoDisposeProviderRef<Query<Notificacao>>;
String _$notificacaoStreamHash() => r'13a219023881ea295925f9c5b0e379cb0f9bf005';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [notificacaoStream].
@ProviderFor(notificacaoStream)
const notificacaoStreamProvider = NotificacaoStreamFamily();

/// See also [notificacaoStream].
class NotificacaoStreamFamily extends Family<AsyncValue<Notificacao>> {
  /// See also [notificacaoStream].
  const NotificacaoStreamFamily();

  /// See also [notificacaoStream].
  NotificacaoStreamProvider call(
    String notificacaoId,
  ) {
    return NotificacaoStreamProvider(
      notificacaoId,
    );
  }

  @override
  NotificacaoStreamProvider getProviderOverride(
    covariant NotificacaoStreamProvider provider,
  ) {
    return call(
      provider.notificacaoId,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'notificacaoStreamProvider';
}

/// See also [notificacaoStream].
class NotificacaoStreamProvider extends AutoDisposeStreamProvider<Notificacao> {
  /// See also [notificacaoStream].
  NotificacaoStreamProvider(
    String notificacaoId,
  ) : this._internal(
          (ref) => notificacaoStream(
            ref as NotificacaoStreamRef,
            notificacaoId,
          ),
          from: notificacaoStreamProvider,
          name: r'notificacaoStreamProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$notificacaoStreamHash,
          dependencies: NotificacaoStreamFamily._dependencies,
          allTransitiveDependencies:
              NotificacaoStreamFamily._allTransitiveDependencies,
          notificacaoId: notificacaoId,
        );

  NotificacaoStreamProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.notificacaoId,
  }) : super.internal();

  final String notificacaoId;

  @override
  Override overrideWith(
    Stream<Notificacao> Function(NotificacaoStreamRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: NotificacaoStreamProvider._internal(
        (ref) => create(ref as NotificacaoStreamRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        notificacaoId: notificacaoId,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Notificacao> createElement() {
    return _NotificacaoStreamProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is NotificacaoStreamProvider &&
        other.notificacaoId == notificacaoId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, notificacaoId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin NotificacaoStreamRef on AutoDisposeStreamProviderRef<Notificacao> {
  /// The parameter `notificacaoId` of this provider.
  String get notificacaoId;
}

class _NotificacaoStreamProviderElement
    extends AutoDisposeStreamProviderElement<Notificacao>
    with NotificacaoStreamRef {
  _NotificacaoStreamProviderElement(super.provider);

  @override
  String get notificacaoId =>
      (origin as NotificacaoStreamProvider).notificacaoId;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
