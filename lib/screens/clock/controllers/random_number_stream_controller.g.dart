// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_number_stream_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomNumberStreamControllerHash() =>
    r'4524c7a831fc878c6ccd6a1c279b6394590927d3';

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

abstract class _$RandomNumberStreamController
    extends BuildlessAutoDisposeStreamNotifier<int> {
  late final int interval;

  Stream<int> build({int interval = 10});
}

/// See also [RandomNumberStreamController].
@ProviderFor(RandomNumberStreamController)
const randomNumberStreamControllerProvider =
    RandomNumberStreamControllerFamily();

/// See also [RandomNumberStreamController].
class RandomNumberStreamControllerFamily extends Family<AsyncValue<int>> {
  /// See also [RandomNumberStreamController].
  const RandomNumberStreamControllerFamily();

  /// See also [RandomNumberStreamController].
  RandomNumberStreamControllerProvider call({int interval = 10}) {
    return RandomNumberStreamControllerProvider(interval: interval);
  }

  @override
  RandomNumberStreamControllerProvider getProviderOverride(
    covariant RandomNumberStreamControllerProvider provider,
  ) {
    return call(interval: provider.interval);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'randomNumberStreamControllerProvider';
}

/// See also [RandomNumberStreamController].
class RandomNumberStreamControllerProvider
    extends
        AutoDisposeStreamNotifierProviderImpl<
          RandomNumberStreamController,
          int
        > {
  /// See also [RandomNumberStreamController].
  RandomNumberStreamControllerProvider({int interval = 10})
    : this._internal(
        () => RandomNumberStreamController()..interval = interval,
        from: randomNumberStreamControllerProvider,
        name: r'randomNumberStreamControllerProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$randomNumberStreamControllerHash,
        dependencies: RandomNumberStreamControllerFamily._dependencies,
        allTransitiveDependencies:
            RandomNumberStreamControllerFamily._allTransitiveDependencies,
        interval: interval,
      );

  RandomNumberStreamControllerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.interval,
  }) : super.internal();

  final int interval;

  @override
  Stream<int> runNotifierBuild(
    covariant RandomNumberStreamController notifier,
  ) {
    return notifier.build(interval: interval);
  }

  @override
  Override overrideWith(RandomNumberStreamController Function() create) {
    return ProviderOverride(
      origin: this,
      override: RandomNumberStreamControllerProvider._internal(
        () => create()..interval = interval,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        interval: interval,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<RandomNumberStreamController, int>
  createElement() {
    return _RandomNumberStreamControllerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is RandomNumberStreamControllerProvider &&
        other.interval == interval;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, interval.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin RandomNumberStreamControllerRef
    on AutoDisposeStreamNotifierProviderRef<int> {
  /// The parameter `interval` of this provider.
  int get interval;
}

class _RandomNumberStreamControllerProviderElement
    extends
        AutoDisposeStreamNotifierProviderElement<
          RandomNumberStreamController,
          int
        >
    with RandomNumberStreamControllerRef {
  _RandomNumberStreamControllerProviderElement(super.provider);

  @override
  int get interval => (origin as RandomNumberStreamControllerProvider).interval;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
