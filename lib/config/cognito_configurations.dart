const cognito_configurations = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "IdentityManager": {
                "Default": {}
            },
            "awsCognitoAuthPlugin": {
                "CognitoUserPool": {
                    "Default": {
                       "PoolId": "us-east-2_CtZ1ShfHp",
                        "AppClientId": "3dvc885p65n8h0iptadvkd4g4s",
                        "Region": "us-east-2",
                        "AppClientSecret": "e4ujbglssiinuhhpmqr21674grqlq876jlrsc5e9llfle0m63tm"
                    }
                },
                "Auth": {
                    "Default": {
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                }
            }
        }
    }
}''';