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
                        "AppClientId": "",
                        "Region": "us-east-2",
                        "AppClientSecret": ""
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