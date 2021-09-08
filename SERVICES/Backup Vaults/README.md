This ARM template is to deply Azure backup vaults

There are 4 parameters to be defined. Below are the sample parameters. for the laWorkspaceID. you can leave it like below or put the ID of your existing Log Analytic Workspace


        "vaultName": {
            "value": "backupvaults-kxu-01"
        },
        "location": {
            "value": "australiaeast"
        },
        "storageType": {
            "value": "LocallyRedundant"
        },
        "laWorkspaceId": {
            "value": ""