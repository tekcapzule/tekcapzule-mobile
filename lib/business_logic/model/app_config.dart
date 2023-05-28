class AppConfig {
  Features? features;
  ResourceConfig? capsule;
  ResourceConfig? topic;

  AppConfig({this.features, this.capsule, this.topic});

  AppConfig.fromJson(Map<String, dynamic> json) {
    features = json['features'] != null
        ? new Features.fromJson(json['features'])
        : null;
    capsule = json['capsule'] != null
        ? new ResourceConfig.fromJson(json['capsule'])
        : null;
    topic = json['topic'] != null
        ? new ResourceConfig.fromJson(json['topic'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.features != null) {
      data['features'] = this.features!.toJson();
    }
    if (this.capsule != null) {
      data['capsule'] = this.capsule!.toJson();
    }
    if (this.topic != null) {
      data['topic'] = this.topic!.toJson();
    }
    return data;
  }
}

class ResourceConfig {
  Infra? infra;

  ResourceConfig({this.infra});

  ResourceConfig.fromJson(Map<String, dynamic> json) {
    infra = json['infra'] != null ? new Infra.fromJson(json['infra']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.infra != null) {
      data['infra'] = this.infra!.toJson();
    }
    return data;
  }
}

class Infra {
  String? gateway;
  String? region;
  String? stage;

  Infra({this.gateway, this.region, this.stage});

  Infra.fromJson(Map<String, dynamic> json) {
    gateway = json['gateway'];
    region = json['region'];
    stage = json['stage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['gateway'] = this.gateway;
    data['region'] = this.region;
    data['stage'] = this.stage;
    return data;
  }
}

class Features {
  bool? awsCognito;

  Features({this.awsCognito});

  Features.fromJson(Map<String, dynamic> json) {
    awsCognito = json['aws_cognito'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['aws_cognito'] = this.awsCognito;
    return data;
  }
}
